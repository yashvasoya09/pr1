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



Certainly! Here's a simple example in Dart, the language used in Flutter, to check if a list contains a specific value:

```dart
void main() {
  List<int> numbers = [1, 2, 3, 4, 5];
  int valueToCheck = 3;

  if (numbers.contains(valueToCheck)) {
    print('$valueToCheck is in the list.');
  } else {
    print('$valueToCheck is not in the list.');
  }
}
```

This code creates a list of integers and checks if a specific value (`valueToCheck`) is present in the list. You can adapt this based on your specific needs. Let me know if you have a different scenario in mind!

Certainly! If you want to compare values in two lists in Dart, you can use various methods. Here's an example using sets to find common elements:

```dart
void main() {
  List<int> list1 = [1, 2, 3, 4, 5];
  List<int> list2 = [3, 4, 5, 6, 7];

  Set<int> set1 = Set.from(list1);
  Set<int> set2 = Set.from(list2);

  Set<int> commonElements = set1.intersection(set2);

  if (commonElements.isNotEmpty) {
    print('Common elements: $commonElements');
  } else {
    print('No common elements.');
  }
}
```

This code creates two lists and then converts them into sets to find the common elements. If there are common elements, it prints them; otherwise, it indicates that there are none. Let me know if you have a specific requirement in mind!


Certainly! First, add the `firebase_ml_vision` package to your `pubspec.yaml` file:

```yaml
dependencies:
  firebase_ml_vision: ^0.12.0
```

Then, run `flutter pub get` in your terminal.

Now, you can use the following example code to perform OCR using Firebase ML Kit in Flutter:

```dart
import 'package:flutter/material.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

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
  String recognizedText = 'OCR Result will appear here';

  Future<void> readText() async {
    final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFilePath(
      'path_to_your_image', // Replace with the path to your image file
    );

    final TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();
    final VisionText visionText = await textRecognizer.processImage(visionImage);

    String text = '';

    for (TextBlock block in visionText.blocks) {
      for (TextLine line in block.lines) {
        for (TextElement element in line.elements) {
          text += element.text + ' ';
        }
        text += '\n'; // Newline after each line
      }
    }

    textRecognizer.close();

    setState(() {
      recognizedText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OCR Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/your_image.png', // Replace with the path to your image asset
              height: 200,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: readText,
              child: Text('Read Text'),
            ),
            SizedBox(height: 20),
            Text(
              recognizedText,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
```

Make sure to replace 'path_to_your_image' and 'assets/your_image.png' with the actual path to your image file. This example provides a basic Flutter app with a button to trigger OCR and display the recognized text.