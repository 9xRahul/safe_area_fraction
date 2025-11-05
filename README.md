# 🧭 Safe Area Fraction

> **A lightweight Flutter utility for safe-area-aware layouts**  
> Apply fractional padding or spacing based on the usable (safe) screen area,  
> so your widgets never overlap notches, status bars, or system UI elements.

---

[![pub package](https://img.shields.io/pub/v/safe_area_fraction.svg)](https://pub.dev/packages/safe_area_fraction)
![platform](https://img.shields.io/badge/platform-flutter%20%7C%20android%20%7C%20ios%20%7C%20web%20%7C%20desktop-blue)
[![License: MIT](https://img.shields.io/badge/license-MIT-green.svg)](https://opensource.org/licenses/MIT)

---

## ✨ Features

✅ Compute **fractional height/width** of the usable screen area  
✅ Respect **SafeArea paddings** automatically  
✅ Works on **all Flutter platforms** (Android, iOS, Web, Windows, macOS, Linux)  
✅ Provides both **Widget** (`SafeFraction`) and **BuildContext extension**  
✅ Zero dependencies — pure Flutter  
✅ Ideal for **responsive layouts**, **dynamic padding**, and **adaptive positioning**

---

## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  safe_area_fraction: ^0.0.5
```

Then run:

```bash
flutter pub get
```

Import in your Dart file:

```dart
import 'package:safe_area_fraction/safe_area_fraction.dart';
```

---

## 🚀 Quick Start

### 🧱 Example 1 — Use as a Widget

```dart
SafeFraction(
  heightFraction: 0.1, // 10% of safe height
  widthFraction: 0.05, // 5% of safe width
  child: Container(
    color: Colors.blueAccent,
    child: const Center(
      child: Text(
        'Safe Fraction Demo',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    ),
  ),
)
```

✅ This ensures your content stays within the visible screen area,  
avoiding notches and system bars automatically.

---

### 💡 Example 2 — Use as a Context Extension

```dart
final paddingFromBottom = context.safeHeightFraction(0.1);
final buttonWidth = context.safeWidthFraction(0.8);

Positioned(
  bottom: paddingFromBottom,
  child: SizedBox(
    width: buttonWidth,
    child: ElevatedButton(
      onPressed: () {},
      child: const Text('Continue'),
    ),
  ),
);
```

---

## 🧠 How It Works

Internally uses Flutter’s `MediaQuery` to calculate safe dimensions:

```dart
final media = MediaQuery.of(context);
final safeHeight = media.size.height - media.padding.top - media.padding.bottom;
final safeWidth  = media.size.width  - media.padding.left - media.padding.right;
```

Your fractions are then multiplied by these **safe area dimensions** to determine consistent spacing.

---

## 🖥️ Platform Support

| Platform | Supported | Notes                               |
| -------- | --------- | ----------------------------------- |
| Android  | ✅        | Safe-area aware                     |
| iOS      | ✅        | Works with notches & home indicator |
| Web      | ✅        | Falls back to full window size      |
| Windows  | ✅        | Works (safe padding usually 0)      |
| macOS    | ✅        | Works (safe padding usually 0)      |
| Linux    | ✅        | Works (safe padding usually 0)      |

---

## 📱 Example App

A minimal demo is included in the `/example` folder.

Run it locally:

```bash
cd example
flutter run
```

**example/lib/main.dart**

```dart
import 'package:flutter/material.dart';
import 'package:safe_area_fraction/safe_area_fraction.dart';

void main() => runApp(const SafeFractionExampleApp());

class SafeFractionExampleApp extends StatelessWidget {
  const SafeFractionExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safe Area Fraction Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text('Safe Area Fraction')),
        body: SafeFraction(
          heightFraction: 0.1,
          widthFraction: 0.05,
          child: Container(
            color: Colors.blueAccent,
            child: const Center(
              child: Text(
                'Safe Area Fraction Example',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

---

## ⚙️ API Reference

### 🧱 `SafeFraction` Widget

| Property         | Type          | Description                                            |
| ---------------- | ------------- | ------------------------------------------------------ |
| `heightFraction` | `double?`     | Fraction (0.0–1.0) of safe height to apply vertically  |
| `widthFraction`  | `double?`     | Fraction (0.0–1.0) of safe width to apply horizontally |
| `extraPadding`   | `EdgeInsets?` | Additional padding added on top of fractional padding  |
| `child`          | `Widget`      | The content widget inside the padding                  |

---

### 🧩 `SafeAreaFractionContext` Extension

| Method                                | Returns  | Description                                    |
| ------------------------------------- | -------- | ---------------------------------------------- |
| `safeHeightFraction(double fraction)` | `double` | Returns a fraction of the usable screen height |
| `safeWidthFraction(double fraction)`  | `double` | Returns a fraction of the usable screen width  |

---

## 🧩 Use Cases

- Dynamically position elements relative to screen size
- Consistent spacing on devices with notches or navigation bars
- Adaptive UIs without wrapping every widget in `SafeArea`
- Responsive padding for tablets, phones, and foldables

---

## 🧱 Project Structure

```
lib/
 ├── safe_area_fraction.dart           # main library file
 └── src/
      ├── widgets/safe_fraction.dart   # SafeFraction widget
      └── extensions/context_safe_fractions.dart  # context extension
```

---

## 🧰 Development

To run tests:

```bash
flutter test
```

To check formatting & linting:

```bash
dart format .
dart analyze
```

---

## 🪄 Version History

| Version | Changes                                                      |
| ------- | ------------------------------------------------------------ |
| 0.0.1   | Initial release with SafeFraction widget & context extension |

---

## 🧾 License

```
MIT License
Copyright (c) 2025 Rahul

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction...
```

---

## 💬 Feedback

If you find a bug or want to suggest a feature, open an issue:  
👉 [GitHub Issues](https://github.com/9xRahul/safe_area_fraction/issues)

---

### ❤️ Made with Flutter

Built and maintained by **Rahul** — follow for more Flutter utility packages.
