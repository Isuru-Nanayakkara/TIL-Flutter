import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // Set app-wide font
        textTheme: GoogleFonts.nunitoTextTheme(
          Theme.of(context).textTheme,
        ),
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
        title: const Text('Google Fonts Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Set a different font for a specific widget
            Text(
              'The quick brown fox jumps over the lazy dog',
              style: GoogleFonts.poppins(),
            ),
            // Google Fonts with existing TextStyle
            Text(
              'The quick brown fox jumps over the dog',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
                fontSize: 18,
              ),
            ),
            // Google Fonts with existing TextStyle
            Text(
              'The quick brown fox jumps over the dog',
              style: GoogleFonts.adventPro(
                textStyle: Theme.of(context).textTheme.bodyText1,
                fontSize: 18,
              ),
            ),
            const Text(
              'The quick brown fox jumps over the dog',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
