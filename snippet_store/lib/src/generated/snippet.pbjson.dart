// This is a generated file - do not edit.
//
// Generated from snippet.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use snippetDescriptor instead')
const Snippet$json = {
  '1': 'Snippet',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'language', '3': 3, '4': 1, '5': 9, '10': 'language'},
    {'1': 'code', '3': 4, '4': 1, '5': 9, '10': 'code'},
    {'1': 'tags', '3': 5, '4': 3, '5': 9, '10': 'tags'},
    {'1': 'saved_at', '3': 6, '4': 1, '5': 9, '10': 'savedAt'},
  ],
};

/// Descriptor for `Snippet`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List snippetDescriptor = $convert.base64Decode(
    'CgdTbmlwcGV0Eg4KAmlkGAEgASgJUgJpZBIUCgV0aXRsZRgCIAEoCVIFdGl0bGUSGgoIbGFuZ3'
    'VhZ2UYAyABKAlSCGxhbmd1YWdlEhIKBGNvZGUYBCABKAlSBGNvZGUSEgoEdGFncxgFIAMoCVIE'
    'dGFncxIZCghzYXZlZF9hdBgGIAEoCVIHc2F2ZWRBdA==');

@$core.Deprecated('Use saveRequestDescriptor instead')
const SaveRequest$json = {
  '1': 'SaveRequest',
  '2': [
    {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    {'1': 'language', '3': 2, '4': 1, '5': 9, '10': 'language'},
    {'1': 'code', '3': 3, '4': 1, '5': 9, '10': 'code'},
    {'1': 'tags', '3': 4, '4': 3, '5': 9, '10': 'tags'},
  ],
};

/// Descriptor for `SaveRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List saveRequestDescriptor = $convert.base64Decode(
    'CgtTYXZlUmVxdWVzdBIUCgV0aXRsZRgBIAEoCVIFdGl0bGUSGgoIbGFuZ3VhZ2UYAiABKAlSCG'
    'xhbmd1YWdlEhIKBGNvZGUYAyABKAlSBGNvZGUSEgoEdGFncxgEIAMoCVIEdGFncw==');

@$core.Deprecated('Use saveResponseDescriptor instead')
const SaveResponse$json = {
  '1': 'SaveResponse',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'saved_at', '3': 2, '4': 1, '5': 9, '10': 'savedAt'},
  ],
};

/// Descriptor for `SaveResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List saveResponseDescriptor = $convert.base64Decode(
    'CgxTYXZlUmVzcG9uc2USDgoCaWQYASABKAlSAmlkEhkKCHNhdmVkX2F0GAIgASgJUgdzYXZlZE'
    'F0');

@$core.Deprecated('Use fetchRequestDescriptor instead')
const FetchRequest$json = {
  '1': 'FetchRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `FetchRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchRequestDescriptor =
    $convert.base64Decode('CgxGZXRjaFJlcXVlc3QSDgoCaWQYASABKAlSAmlk');

@$core.Deprecated('Use listRequestDescriptor instead')
const ListRequest$json = {
  '1': 'ListRequest',
  '2': [
    {'1': 'language', '3': 1, '4': 1, '5': 9, '10': 'language'},
    {'1': 'limit', '3': 2, '4': 1, '5': 5, '10': 'limit'},
  ],
};

/// Descriptor for `ListRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listRequestDescriptor = $convert.base64Decode(
    'CgtMaXN0UmVxdWVzdBIaCghsYW5ndWFnZRgBIAEoCVIIbGFuZ3VhZ2USFAoFbGltaXQYAiABKA'
    'VSBWxpbWl0');

@$core.Deprecated('Use deleteRequestDescriptor instead')
const DeleteRequest$json = {
  '1': 'DeleteRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `DeleteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRequestDescriptor =
    $convert.base64Decode('Cg1EZWxldGVSZXF1ZXN0Eg4KAmlkGAEgASgJUgJpZA==');

@$core.Deprecated('Use deleteResponseDescriptor instead')
const DeleteResponse$json = {
  '1': 'DeleteResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `DeleteResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteResponseDescriptor = $convert.base64Decode(
    'Cg5EZWxldGVSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEhgKB21lc3NhZ2UYAi'
    'ABKAlSB21lc3NhZ2U=');
