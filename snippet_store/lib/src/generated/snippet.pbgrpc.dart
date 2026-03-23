// This is a generated file - do not edit.
//
// Generated from snippet.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'snippet.pb.dart' as $0;

export 'snippet.pb.dart';

@$pb.GrpcServiceName('snippet.SnippetStore')
class SnippetStoreClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  SnippetStoreClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.SaveResponse> saveSnippet(
    $0.SaveRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$saveSnippet, request, options: options);
  }

  $grpc.ResponseFuture<$0.Snippet> fetchSnippet(
    $0.FetchRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$fetchSnippet, request, options: options);
  }

  $grpc.ResponseStream<$0.Snippet> listByLanguage(
    $0.ListRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createStreamingCall(
        _$listByLanguage, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.DeleteResponse> deleteSnippet(
    $0.DeleteRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteSnippet, request, options: options);
  }

  // method descriptors

  static final _$saveSnippet =
      $grpc.ClientMethod<$0.SaveRequest, $0.SaveResponse>(
          '/snippet.SnippetStore/SaveSnippet',
          ($0.SaveRequest value) => value.writeToBuffer(),
          $0.SaveResponse.fromBuffer);
  static final _$fetchSnippet = $grpc.ClientMethod<$0.FetchRequest, $0.Snippet>(
      '/snippet.SnippetStore/FetchSnippet',
      ($0.FetchRequest value) => value.writeToBuffer(),
      $0.Snippet.fromBuffer);
  static final _$listByLanguage =
      $grpc.ClientMethod<$0.ListRequest, $0.Snippet>(
          '/snippet.SnippetStore/ListByLanguage',
          ($0.ListRequest value) => value.writeToBuffer(),
          $0.Snippet.fromBuffer);
  static final _$deleteSnippet =
      $grpc.ClientMethod<$0.DeleteRequest, $0.DeleteResponse>(
          '/snippet.SnippetStore/DeleteSnippet',
          ($0.DeleteRequest value) => value.writeToBuffer(),
          $0.DeleteResponse.fromBuffer);
}

@$pb.GrpcServiceName('snippet.SnippetStore')
abstract class SnippetStoreServiceBase extends $grpc.Service {
  $core.String get $name => 'snippet.SnippetStore';

  SnippetStoreServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SaveRequest, $0.SaveResponse>(
        'SaveSnippet',
        saveSnippet_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SaveRequest.fromBuffer(value),
        ($0.SaveResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FetchRequest, $0.Snippet>(
        'FetchSnippet',
        fetchSnippet_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FetchRequest.fromBuffer(value),
        ($0.Snippet value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListRequest, $0.Snippet>(
        'ListByLanguage',
        listByLanguage_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.ListRequest.fromBuffer(value),
        ($0.Snippet value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteRequest, $0.DeleteResponse>(
        'DeleteSnippet',
        deleteSnippet_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteRequest.fromBuffer(value),
        ($0.DeleteResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.SaveResponse> saveSnippet_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.SaveRequest> $request) async {
    return saveSnippet($call, await $request);
  }

  $async.Future<$0.SaveResponse> saveSnippet(
      $grpc.ServiceCall call, $0.SaveRequest request);

  $async.Future<$0.Snippet> fetchSnippet_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.FetchRequest> $request) async {
    return fetchSnippet($call, await $request);
  }

  $async.Future<$0.Snippet> fetchSnippet(
      $grpc.ServiceCall call, $0.FetchRequest request);

  $async.Stream<$0.Snippet> listByLanguage_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.ListRequest> $request) async* {
    yield* listByLanguage($call, await $request);
  }

  $async.Stream<$0.Snippet> listByLanguage(
      $grpc.ServiceCall call, $0.ListRequest request);

  $async.Future<$0.DeleteResponse> deleteSnippet_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.DeleteRequest> $request) async {
    return deleteSnippet($call, await $request);
  }

  $async.Future<$0.DeleteResponse> deleteSnippet(
      $grpc.ServiceCall call, $0.DeleteRequest request);
}
