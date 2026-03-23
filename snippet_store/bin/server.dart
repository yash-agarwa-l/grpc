import 'dart:collection';
import 'package:grpc/grpc.dart';
import '../lib/src/generated/snippet.pbgrpc.dart';
import '../lib/src/generated/snippet.pb.dart';

class SnippetService extends SnippetStoreServiceBase {
  // In-memory store — key: id, value: Snippet
  final _store = LinkedHashMap<String, Snippet>();
  int _counter = 0;

  @override
  Future<SaveResponse> saveSnippet(ServiceCall call, SaveRequest req) async {
    final id = 'snip_${++_counter}';
    final now = DateTime.now().toIso8601String();
    final snippet = Snippet()
      ..id = id
      ..title = req.title
      ..language = req.language
      ..code = req.code
      ..tags.addAll(req.tags)
      ..savedAt = now;
    _store[id] = snippet;
    print('[server] saved: $id (${req.language})');
    return SaveResponse()
      ..id = id
      ..savedAt = now;
  }

  @override
  Future<Snippet> fetchSnippet(ServiceCall call, FetchRequest req) async {
    final snippet = _store[req.id];
    if (snippet == null) {
      throw GrpcError.notFound('Snippet ${req.id} not found');
    }
    return snippet;
  }

  @override
  Stream<Snippet> listByLanguage(ServiceCall call, ListRequest req) async* {
    int count = 0;
    for (final snippet in _store.values) {
      if (snippet.language.toLowerCase() == req.language.toLowerCase()) {
        yield snippet;
        count++;
        if (req.limit > 0 && count >= req.limit) break;
        // small delay to make streaming observable
        await Future.delayed(Duration(milliseconds: 100));
      }
    }
  }

  @override
  Future<DeleteResponse> deleteSnippet(
      ServiceCall call, DeleteRequest req) async {
    if (_store.containsKey(req.id)) {
      _store.remove(req.id);
      print('[server] deleted: ${req.id}');
      return DeleteResponse()
        ..success = true
        ..message = 'Deleted ${req.id}';
    }
    return DeleteResponse()
      ..success = false
      ..message = '${req.id} not found';
  }
}

void main() async {
  final server = Server.create(services: [SnippetService()]);
  await server.serve(port: 50051);
  print('SnippetStore server on :50051');
}
