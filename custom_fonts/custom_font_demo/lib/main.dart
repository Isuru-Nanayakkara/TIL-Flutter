import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'PostNoBillsColombo',
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Font Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'The quick brown fox jumps over the lazy dog',
            ),
            Text(
              'The quick brown fox jumps over the dog',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 22,
              ),
            ),
            Text(
              'The quick brown fox jumps over the dog',
              style: TextStyle(
                fontSize: 22,
                fontStyle: FontStyle.italic,
              ),
            ),
            Text(
              'The quick brown fox jumps over the dog',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
