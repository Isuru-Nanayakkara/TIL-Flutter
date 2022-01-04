# Markdown Demo

How to show Markdown content using the [flutter_markdown](https://pub.dev/packages/flutter_markdown) package.

---

## Steps

1. Add `flutter_markdown: ^0.6.9` to the **pubspec.yaml** file.

2. Add a markdown file to the assets folder and add it in the **pubspec.yaml** file.

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

![demo](https://raw.githubusercontent.com/Isuru-Nanayakkara/TIL-Flutter/main/img/markdown.png)