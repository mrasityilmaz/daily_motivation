part of '../favorites_viewmodel.dart';

///
/// TODO - Upcoming feature - Multiple Selection
///
mixin _MultipleChooseHelperMixin on ChangeNotifier {
//   final Map<String, bool> _chooseStates = <String, bool>{};

//   List<String> get chosenItems {
//     return _chooseStates.entries
//         .map(
//           (item) {
//             if (item.value) {
//               return item.key;
//             } else {
//               return null;
//             }
//           },
//         )
//         .toList()
//         .nonNulls as List<String>;
//   }

//   /// Returns the choose status for an object if it exists. Returns false if not present
//   bool isChoosen(String objectId) => _chooseStates[objectId] ?? false;

//   // Returns true if any objects still have a choose status that is true.
//   bool get anyObjectsBusy => _chooseStates.values.any((choose) => choose);

//   /// Sets the status state for the object equal to the value passed in and notifies Listeners
//   /// If you're using a primitive type the value SHOULD NOT BE CHANGED, since Hashcode uses == value
//   void setChooseForObject(String objectId, {required bool value}) {
//     _chooseStates[objectId] = value;
//     notifyListeners();
//   }

//   bool _multiChooseMode = false;

//   bool get multiChooseMode => _multiChooseMode;

//   void setMultiChooseMode({bool value = true}) {
//     _multiChooseMode = value;

//     notifyListeners();
//   }
}
