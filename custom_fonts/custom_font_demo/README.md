# Custom Font Demo

How to use a custom font in app.

---

## Notes

* [Official Docs](https://docs.flutter.dev/cookbook/design/fonts)

* Create a folder called _assets_ and a subfolder called _fonts_ inside it.

* Add the font files to it. Only `.ttf` and `.otf` file types are supported.

* Declare the font in `pubspec.yaml` file.

```yaml
flutter:

  fonts:
    - family: PostNoBillsColombo
      fonts:
        - asset: assets/fonts/PostNoBillsColombo-Light.ttf
        - asset: assets/fonts/PostNoBillsColombo-Regular.ttf
        - asset: assets/fonts/PostNoBillsColombo-Medium.ttf
        - asset: assets/fonts/PostNoBillsColombo-SemiBold.ttf
        - asset: assets/fonts/PostNoBillsColombo-Bold.ttf
        - asset: assets/fonts/PostNoBillsColombo-ExtraBold.ttf
```

```dart
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'PostNoBillsColombo',
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
      body: Column(
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
    );
  }
}
```

![demo](https://raw.githubusercontent.com/Isuru-Nanayakkara/TIL-Flutter/main/img/custom_font.png)