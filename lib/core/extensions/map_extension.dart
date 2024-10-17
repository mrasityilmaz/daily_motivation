extension MapExtension on Map<String, dynamic>? {
  /// Get the difference between two maps
  /// It's comparing the values of the maps
  /// Returns a map with the entries that are different
  Map<String, dynamic> diffEntries(Map<String, dynamic>? other) {
    return Map.fromEntries(this?.entries.where((element) => element.value != other?[element.key]) ?? []);
  }

  /// Convert the difference between two maps to a string
  ///  - [other] is the other map to compare with
  ///
  /// ```dart
  /// final map1 = {'name': 'John', 'age': 25};
  /// final map2 = {'name': 'John', 'age': 30};
  ///
  /// print(map1.diffEntriesToString(map2));
  ///
  /// // Output:
  /// // age: From => 25 | To => 30
  ///
  /// ```
  ///
  String diffEntriesToString(Map<String, dynamic>? other) {
    return diffEntries(other)
        .entries
        .map((e) => '\n${e.key}: From => ${other?[e.key]} | To => ${e.value}')
        .toList()
        .join();
  }
}
