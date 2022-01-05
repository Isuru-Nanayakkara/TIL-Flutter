import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

void main() {
  runApp(const MyApp());
}

// https://gist.github.com/rohan20/7c6925d06284d3172a84e5db8f505a3b

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
}

class _AnyTappableWidget extends StatelessWidget {
  const _AnyTappableWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => debugPrint('Text tapped'),
      child: const Text('A tappable widget'),
    );
  }
}

class _NumberTextField extends StatelessWidget {
  const _NumberTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextField(
        decoration: const InputDecoration(
          hintText: 'Digits Only',
          border: OutlineInputBorder(),
        ),
        controller: TextEditingController(),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          // FilteringTextInputFormatter.digitsOnly,
          FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
        ],
      ),
    );
  }
}
