# pr1

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


<p>

<img src = https://user-images.githubusercontent.com/120082183/218687403-19330d1e-57ea-4b50-92c8-9d7126ee68fe.png  height=30% width=30%>

<\p>


Certainly! If you prefer a different package for speech-to-text in Flutter, you can use the `speech_to_text` package. Update your `pubspec.yaml` file:

```yaml
dependencies:
  speech_to_text: ^5.0.1
```

Run `flutter pub get` in your terminal, and then modify your Flutter code:

```dart
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  stt.SpeechToText _speech;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speech to Text Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            if (!_speech.isListening) {
              startListening();
            } else {
              stopListening();
            }
          },
          child: Text(_speech.isListening ? 'Stop Listening' : 'Start Listening'),
        ),
      ),
    );
  }

  void startListening() {
    _speech.listen(
      onResult: (result) {
        setState(() {
          // Handle the recognized text as needed
          print('Speech result: ${result.recognizedWords}');
        });
      },
      listenFor: Duration(seconds: 10),
    );
  }

  void stopListening() {
    _speech.stop();
  }
}
```

This example uses the `speech_to_text` package, providing a simple button to start and stop speech recognition. Remember to handle permissions and customize the code according to your application's requirements.