# Dismiss Keyboard Demo

How to dismiss the keyboard by tapping anywhere.

Credit goes out to [Rohan Taneja](https://twitter.com/rohantaneja_) for this [solution](https://gist.github.com/rohan20/7c6925d06284d3172a84e5db8f505a3b#gistcomment-4012851).

---

## Steps

1. Add [flutter_keyboard_visibility](https://pub.dev/packages/flutter_keyboard_visibility) to the project.

```dart
@override
Widget build(BuildContext context) {
  return MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: KeyboardVisibilityBuilder(
      builder: (BuildContext context, bool isKeyboardVisible) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: isKeyboardVisible
              ? () {
                  FocusScope.of(context).unfocus();
                  debugPrint('Keyboard dismissed');
                }
              : null,
          child: AbsorbPointer(
            absorbing: isKeyboardVisible,
            child: Scaffold(
              appBar: AppBar(title: const Text('Keyboard Dismiss Demo')),
              body: Center(
                child: Column(
                  children: const [
                    SizedBox(height: 24),
                    _AnyTappableWidget(),
                    SizedBox(height: 24),
                    _NumberTextField(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}
```