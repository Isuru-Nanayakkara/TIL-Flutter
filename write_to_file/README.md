# Write to File Demo

How to write data to a file and save it in the file system of an Android device.

---

## Notes

* [Official Docs](https://docs.flutter.dev/cookbook/persistence/reading-writing-files)

* Add [android_path_provider](https://pub.dev/packages/android_path_provider) package to the project.

```dart
void _saveFile() async {
  final user = User(id: 1, firstName: 'Isuru', lastName: 'Nanayakkara');

  String json = jsonEncode(user);

  try {
    var downloadsDirPath = await AndroidPathProvider.downloadsPath;
    File file = File('$downloadsDirPath/file.txt');
    file.writeAsString(json);
  } catch (e) {
    debugPrint(e.toString());
  }
}
```


![demo](https://raw.githubusercontent.com/Isuru-Nanayakkara/TIL-Flutter/main/img/file_in_downloads.png)