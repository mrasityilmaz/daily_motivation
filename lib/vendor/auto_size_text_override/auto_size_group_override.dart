// import 'dart:async';

// import 'package:daily_motivation/vendor/auto_size_text_override/auto_size_text_override.dart';

// /// Controller to synchronize the fontSize of multiple AutoSizeTexts.
// class CustomAutoSizeGroup {
//   final listeners = <CustomAutoSizeTextState, double>{};
//   bool widgetsNotified = false;
//   double fontSize = double.infinity;

//   void register(CustomAutoSizeTextState text) {
//     listeners[text] = double.infinity;
//   }

//   void updateFontSize(CustomAutoSizeTextState text, double maxFontSize) {
//     final oldFontSize = fontSize;
//     if (maxFontSize <= fontSize) {
//       fontSize = maxFontSize;
//       listeners[text] = maxFontSize;
//     } else if (listeners[text] == fontSize) {
//       listeners[text] = maxFontSize;
//       fontSize = double.infinity;
//       for (final size in listeners.values) {
//         if (size < fontSize) fontSize = size;
//       }
//     } else {
//       listeners[text] = maxFontSize;
//     }

//     if (oldFontSize != fontSize) {
//       widgetsNotified = false;
//       scheduleMicrotask(notifyListeners);
//     }
//   }

//   void notifyListeners() {
//     if (widgetsNotified) {
//       return;
//     } else {
//       widgetsNotified = true;
//     }

//     for (final textState in listeners.keys) {
//       if (textState.mounted) {
//         textState.notifySync();
//       }
//     }
//   }

//   void remove(CustomAutoSizeTextState text) {
//     updateFontSize(text, double.infinity);
//     listeners.remove(text);
//   }
// }
