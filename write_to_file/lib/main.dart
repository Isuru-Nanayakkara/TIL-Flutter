import 'dart:convert';
import 'dart:io';

import 'package:android_path_provider/android_path_provider.dart';
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
  void _saveFile() async {
    final user = User(id: 1, firstName: 'Isuru', lastName: 'Nanayakkara');

    String json = jsonEncode(user);
    // debugPrint(json);

    try {
      var downloadsDirPath = await AndroidPathProvider.downloadsPath;
      debugPrint(downloadsDirPath);
      File file = File('$downloadsDirPath/file.txt');
      file.writeAsString(json);
      debugPrint('✅ Success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Save File to Disk Demo'),
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
