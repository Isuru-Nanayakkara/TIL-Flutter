import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _saveFile() {
    final user = User(id: 1, firstName: 'Isuru', lastName: 'Nanayakkara');

    String json = jsonEncode(user);
    debugPrint(json);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Save File to Disk Demo'),
      ),
      body: const Center(
        child: Text('Demo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveFile,
        tooltip: 'Save File',
        child: const Icon(Icons.save),
      ),
    );
  }
}

class User {
  final int id;
  final String firstName;
  final String lastName;

  User({required this.id, required this.firstName, required this.lastName});

  Map toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
      };
}
