import 'package:flutter/material.dart';

class MyFutureClass extends StatefulWidget {
  const MyFutureClass({super.key});

  @override
  State<MyFutureClass> createState() => _MyFutureClassState();
}

class _MyFutureClassState extends State<MyFutureClass> {
  final nameController = TextEditingController();
  Future<String>? _futureResult;

  Future<String> loadUserData() async {
    await Future.delayed(const Duration(seconds: 1));
    return 'Welcome ${nameController.text}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            SizedBox(
                width: 200,
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Enter your name",
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
                  setState(() {
                    _futureResult = loadUserData();
                  });
                },
                child: const Text('Done',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500))),
            const SizedBox(height: 30),
            _futureResult == null
                ? const Text('No Data',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                        fontSize: 20))
                : FutureBuilder(
                    future: _futureResult,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasData) {
                        return Text(snapshot.data ?? '',
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16));
                      } else {
                        return Text('Error: ${snapshot.error}',
                            style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                                fontSize: 16));
                      }
                    })
          ],
        ),
      ),
    );
  }
}
