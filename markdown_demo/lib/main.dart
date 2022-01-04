import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Markdown"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: FutureBuilder(
          future: rootBundle.loadString('assets/files/disclaimer.md'),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              return MarkdownBody(
                data: snapshot.data!,
                styleSheet: MarkdownStyleSheet(
                  a: TextStyle(
                    color: Colors.blue[600],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTapLink: (text, url, title) {
                  debugPrint(url!);
                  _openURLInBrowser(url: url, inApp: true);
                },
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

Future _openURLInBrowser({required String url, bool inApp = false}) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: inApp,
      forceWebView: inApp,
      enableJavaScript: true,
    );
  } else {
    debugPrint('Invalid URL');
  }
}
