import 'dart:async';
import 'package:flutter/material.dart';

class MyStreamClass extends StatefulWidget {
  const MyStreamClass({super.key});

  @override
  State<MyStreamClass> createState() => _MyStreamClassState();
}

class _MyStreamClassState extends State<MyStreamClass> {
  StreamController<String> streamController = StreamController<String>();
  TextEditingController textEditingController = TextEditingController();

  late Stream<String> streamData;

  @override
  void initState() {
    streamData = streamController.stream.asBroadcastStream();
    super.initState();
  }

  Stream<int> getNumbers() async* {
    for (int i = 1; i <= 5; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<int>(
                stream: getNumbers(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    return Text('${snapshot.error}',
                        style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                            fontSize: 16));
                  } else {
                    return Text('Data: ${snapshot.data}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20));
                  }
                }),
            const SizedBox(height: 30),
            StreamBuilder<String>(
              stream: streamData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data ?? 'Null Data',
                      style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                          fontSize: 20));
                } else {
                  return const Text('No Data',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                          fontSize: 20));
                }
              },
            ),
            const SizedBox(height: 20),
            StreamBuilder<String>(
              stream: streamData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data ?? 'Null Data',
                      style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                          fontSize: 20));
                } else {
                  return const Text('No Data',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                          fontSize: 20));
                }
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
                width: 200,
                child: TextField(
                  controller: textEditingController,
                  decoration: const InputDecoration(
                    labelText: "Enter anything",
                    border: OutlineInputBorder(),
                  ),
                )),
            const SizedBox(height: 20),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15)),
                onPressed: () {
                  streamController.add(textEditingController.text);
                },
                child: const Text('Done',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500)))
          ],
        ),
      ),
    );
  }
}
