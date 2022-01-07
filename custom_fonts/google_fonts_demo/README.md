# Google Fonts Demo

How to use [Google Fonts](https://fonts.google.com) in an app.

---
## Notes

* Add [google_fonts](https://pub.dev/packages/google_fonts) package to the project.

```dart
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Set app-wide font
        textTheme: GoogleFonts.nunitoTextTheme(
          Theme.of(context).textTheme,
        ),
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
        ],
      ),
    );
  }
}
```

![demo](https://raw.githubusercontent.com/Isuru-Nanayakkara/TIL-Flutter/main/img/google_fonts.png)