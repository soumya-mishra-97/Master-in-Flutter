import 'dart:async';

import 'package:flutter/material.dart';

// Stream:
/// Handles asynchronous data events and  It can emit multiple values over time.
Stream<int> countStream() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(const Duration(seconds: 1));

    /// Simulating delay
    yield i;

    /// Emits a value to the stream
  }
}

Stream<String> fetchMessages() async* {
  print('Loading...');
  await Future.delayed(const Duration(seconds: 2));
  print('Data fetched.');
  print('Processing data...');
  await Future.delayed(const Duration(seconds: 1));
  print('Done!');
}

// Single Subscription Stream:
/// It can have only one listener. If another listener tries to listen to it, it will throw an error.
/// Once the stream is consumed, it's closed, and you can't listen to it again.
Stream<int> singleStream() async* {
  yield 1;
  yield 2;
}

// Broadcast Stream:
/// It allows multiple listeners.
/// Multiple listeners can subscribe to the same stream at the same time, and they will all receive the events.
Stream<int> broadcastStream() {
  /// Stream.periodic:
  /// Creating a Stream with Stream.periodic.
  /// It emit values periodically with a delay.
  return Stream<int>.periodic(const Duration(seconds: 1), (count) => count)
      .asBroadcastStream();
}

// yield* (Delegating Streams)
/// yield* is used to delegate another stream inside an async* function.
/// Instead of yielding values one by one, it forwards all values from another stream.
/// Example: 1st Stream - count 1...3 then forwards to another stream and count 3..5
Stream<int> countThree() async* {
  for (int i = 1; i <= 3; i++) {
    yield i;
  }
}

Stream<int> countFive() async* {
  yield* countThree();

  /// Here forwards all values of  countThree from countFive stream.
  for (int i = 4; i <= 5; i++) {
    yield i;
  }
}

// Stream.fromIterable
/// Creating a Stream with Stream.fromIterable.
/// If you have a collection of values (like a list), you can convert it into a stream.
Stream<int> streamIterable() {
  List<int> a = [1, 2, 3, 4, 5];
  return Stream.fromIterable(a);
}

// Stream.periodic
/// Creating a Stream with Stream.periodic.
/// It emit values periodically with a delay.
/// Stream.periodic generates values on a periodic basis (every second here) and can be limited using .take().
Stream<int> streamPeriodic() {
  return Stream.periodic(const Duration(seconds: 1), (count) => count).take(5);
}

// StreamController
/// It provides more control over when data is added to the stream.
/// You can add data manually to the stream, pause or cancel subscriptions, and even close the stream.
/// How it works:
/// StreamController lets you manually add data to the stream using controller.add().
/// You can close the stream with controller.close()
Stream<int> customStream() {
  final controller = StreamController<int>();

  Future.delayed(const Duration(seconds: 1), () => controller.add(1));
  Future.delayed(const Duration(seconds: 2), () => controller.add(2));
  Future.delayed(const Duration(seconds: 3), () => controller.add(3));
  Future.delayed(const Duration(seconds: 4), () => controller.close());
  return controller.stream;
}

// Stream Event Handlers -> listen():
/// How to Use a Stream: listen() -> data, onDone, onError
/// Once you have a stream, you can use it with listen(), which allows you to react to new data as it arrives.
/// You can listen to streams using the listen() method and handle data, errors, and completion events.
/// onData: This callback is triggered when new data is emitted to the stream.
/// onDone: This callback is called when the stream is closed or done.
/// onError: This callback is called when there’s an error in the stream.
Stream<int> gteNumberStream() {
  List<int> a = [1, 2, 3, 4, 5];
  return Stream.fromIterable(a);
}

void main() {
  // Stream
  /*countStream().listen((events){
    print(events);
  });*/

  /*fetchMessages().listen((events){
    print(events);
  });*/

  // yield* (Delegating Streams)
  //countFive().listen((value) => print(value));

  // Single Subscription Stream
  //Stream<int> singleSubStream = singleStream();

  /// In this case only Listener 1 is called.
  /*singleSubStream.listen((events){
    print('Listener 1: $events); /// Once the stream is consumed, it's closed, and you can't listen to it again.
  });*/

  /// if this case  Listener 2 is called then it will throw an error.
  ///  If another listener tries to listen to it, it will throw an error.
  ///  State has already been listen to.
  /*singleSubStream.listen((events){
    print('Listener 2: $events);
  });*/

  // Broadcast Stream
  //Stream<int> broadCastStream = broadcastStream();
  /// In this case both Listener 1 & 2 is called on sametime.
  /*broadCastStream.listen((count) => print('Listener 1: $count'));
  broadCastStream.listen((count) => print('Listener 2: $count'));*/

  // Stream.fromIterable
  /*streamIterable().listen((counts){
    print("Iterable counts $counts");
  });*/

  // Stream.periodic
  /*streamPeriodic().listen((counts){
    print("Periodic counts $counts");
  });*/

  // StreamController
  /*customStream().listen((count) {
    print('Stream Controller: $count');
  });*/

  // Stream Event Handlers -> listen()
  gteNumberStream().listen((data) {
    print(data);
  }, onDone: () {
    print("Stream has closed");
  }, onError: (e) {
    print('Error $e');
  });
}
