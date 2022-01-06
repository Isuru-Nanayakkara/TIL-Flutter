# Markdown Demo

How to show Markdown content.

---

## Steps

* Add [flutter_markdown](https://pub.dev/packages/flutter_markdown) package to the project.

* Add a markdown file to the assets folder and add it in the `pubspec.yaml` file.

```dart
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
                a: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTapLink: (text, url, title) {
                debugPrint(url!);
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
```

![demo](https://raw.githubusercontent.com/Isuru-Nanayakkara/TIL-Flutter/main/visuals/markdown.png)