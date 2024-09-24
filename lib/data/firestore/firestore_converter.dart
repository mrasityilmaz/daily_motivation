import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:quotely/core/errors/errors.dart';

abstract mixin class FirestoreConverter<T extends Object> {
  const FirestoreConverter();

  @nonVirtual
  T? fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    try {
      final data = snapshot.data();

      if (data == null) return null;
      return (T as FirestoreConverter<T>).convertFromMap(data);
    } catch (e, s) {
      debugPrint('FirebaseConverter.fromFirestore - $T: $e, $s');
      rethrow;
    }
  }

  @nonVirtual
  Map<String, Object?> toFirestore(
    T? model,
    SetOptions? options,
  ) {
    try {
      if (model == null) {
        throw FirestoreException(errorMessage: 'Model is null - $T');
      }

      return (model as FirestoreConverter<T>).convertToMap();
    } on FirestoreException catch (e) {
      debugPrint('FirestoreConverter.toFirestore - FirestoreException: $e');
      rethrow;
    } catch (e, s) {
      debugPrint('FirebaseConverter.toFirestore - $T: $e, $s');
      rethrow;
    }
  }

  T convertFromMap(Map<String, dynamic> json);

  Map<String, dynamic> convertToMap();
}
