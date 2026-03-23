import 'package:grpc/grpc.dart';
import '../lib/src/generated/snippet.pbgrpc.dart';
import '../lib/src/generated/snippet.pb.dart';

void main() async {
  final channel = ClientChannel('localhost',
      port: 50051,
      options:
          const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final client = SnippetStoreClient(channel);

  // 1. Save three snippets
  print('\n--- SaveSnippet ---');
  final r1 = await client.saveSnippet(SaveRequest()
    ..title = 'Fibonacci in Dart'
    ..language = 'dart'
    ..code = 'int fib(int n) => n <= 1 ? n : fib(n-1) + fib(n-2);'
    ..tags.addAll(['recursion', 'math']));
  print('Saved: ${r1.id} at ${r1.savedAt}');

  final r2 = await client.saveSnippet(SaveRequest()
    ..title = 'Reverse a string'
    ..language = 'dart'
    ..code = "String rev(String s) => s.split('').reversed.join();"
    ..tags.addAll(['string', 'util']));
  print('Saved: ${r2.id} at ${r2.savedAt}');

  final r3 = await client.saveSnippet(SaveRequest()
    ..title = 'FlatMap example'
    ..language = 'kotlin'
    ..code = 'listOf(1,2,3).flatMap { listOf(it, it*2) }'
    ..tags.addAll(['functional']));
  print('Saved: ${r3.id} at ${r3.savedAt}');

  // 2. Fetch one by id
  print('\n--- FetchSnippet ---');
  final fetched = await client.fetchSnippet(FetchRequest()..id = r1.id);
  print('Fetched: ${fetched.title} [${fetched.language}]');
  print('  Code: ${fetched.code}');
  print('  Tags: ${fetched.tags}');

  // 3. Stream all dart snippets
  print('\n--- ListByLanguage (dart) ---');
  final stream =
      client.listByLanguage(ListRequest()..language = 'dart'..limit = 10);
  await for (final s in stream) {
    print('  ${s.id}: ${s.title}');
  }

  // 4. Delete one
  print('\n--- DeleteSnippet ---');
  final del = await client.deleteSnippet(DeleteRequest()..id = r2.id);
  print('Delete result: ${del.success} — ${del.message}');

  // Confirm it's gone
  print('\n--- ListByLanguage after delete ---');
  final stream2 = client.listByLanguage(
      ListRequest()..language = 'dart'..limit = 10);
  await for (final s in stream2) {
    print('  ${s.id}: ${s.title}');
  }

  await channel.shutdown();
}
