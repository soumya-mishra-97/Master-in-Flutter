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
                    return Text('${snapshot.error}');
                  } else {
                    return Text('Data: ${snapshot.data}');
                  }
                }),
            StreamBuilder<String>(
              stream: streamData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data ?? 'Null Data',
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 24));
                } else {
                  return const Text('No Data',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 24));
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
                          fontWeight: FontWeight.w500, fontSize: 24));
                } else {
                  return const Text('No Data',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 24));
                }
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
                width: 200,
                child: TextField(
                  controller: textEditingController,
                )),
            const SizedBox(height: 20),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
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
