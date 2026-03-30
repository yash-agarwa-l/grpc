# SnippetStore — gRPC Code Snippet Service

A gRPC service built with Dart that lets you save, fetch, list, and delete code snippets. It demonstrates **unary RPCs** and **server-side streaming** using Protocol Buffers.

## Project Structure

```
snippet_store/
  protos/
    snippet.proto          # Service & message definitions
  bin/
    server.dart            # gRPC server implementation
    client.dart            # Demo client exercising all RPCs
  lib/src/generated/       # Auto-generated Dart code from protoc
    snippet.pb.dart
    snippet.pbgrpc.dart
    snippet.pbenum.dart
    snippet.pbjson.dart
  pubspec.yaml
```

## RPCs

| Method | Type | Request | Response |
|--------|------|---------|----------|
| `SaveSnippet` | Unary | `title`, `language`, `code`, `tags` | `id`, `saved_at` |
| `FetchSnippet` | Unary | `id` | Full `Snippet` object |
| `ListByLanguage` | Server streaming | `language`, `limit` | Stream of `Snippet` |
| `DeleteSnippet` | Unary | `id` | `success`, `message` |

## Prerequisites

- [Dart SDK](https://dart.dev/get-dart) >= 3.0.0
- [Protocol Buffers compiler (`protoc`)](https://grpc.io/docs/protoc-installation/)
- Dart protoc plugin:
  ```bash
  dart pub global activate protoc_plugin
  ```

## Setup

### 1. Install dependencies

```bash
cd snippet_store
dart pub get
```

### 2. Generate protobuf Dart files

```bash
protoc --dart_out=grpc:lib/src/generated \
  -Iprotos \
  protos/snippet.proto
```

This generates the message classes and gRPC service stubs in `lib/src/generated/`.

## Running

### Start the server

```bash
dart run bin/server.dart
```

Output:
```
SnippetStore server on :50051
```

### Run the client (in a separate terminal)

```bash
dart run bin/client.dart
```

### Expected output

```
--- SaveSnippet ---
Saved: snip_1 at 2026-03-29T...
Saved: snip_2 at 2026-03-29T...
Saved: snip_3 at 2026-03-29T...

--- FetchSnippet ---
Fetched: Fibonacci in Dart [dart]
  Code: int fib(int n) => n <= 1 ? n : fib(n-1) + fib(n-2);
  Tags: [recursion, math]

--- ListByLanguage (dart) ---
  snip_1: Fibonacci in Dart
  snip_2: Reverse a string

--- DeleteSnippet ---
Delete result: true — Deleted snip_2

--- ListByLanguage after delete ---
  snip_1: Fibonacci in Dart
```

## How It Works

1. **`snippet.proto`** defines the service contract — four RPCs and the message shapes (`Snippet`, `SaveRequest`, etc.)
2. **`protoc`** generates Dart classes for every message and a base class (`SnippetStoreServiceBase`) for the server plus a client stub (`SnippetStoreClient`)
3. **`server.dart`** extends the generated base class, implements each RPC with in-memory storage using a `LinkedHashMap`, and serves on port `50051`
4. **`client.dart`** uses the generated client stub to call each RPC — demonstrating save, fetch, server-streaming list, and delete

### Server-Side Streaming

`ListByLanguage` is a **server-streaming RPC** — instead of returning a single response, it `yield`s `Snippet` objects one at a time. The client consumes them with `await for`. This is useful when results could be large or when you want the client to start processing before all results are ready.

## Tech Stack

- **Dart** — language
- **gRPC** — RPC framework (HTTP/2 transport)
- **Protocol Buffers (proto3)** — serialization format and service definition
- **`grpc` package** — Dart gRPC library
- **`protobuf` package** — Dart protobuf runtime
