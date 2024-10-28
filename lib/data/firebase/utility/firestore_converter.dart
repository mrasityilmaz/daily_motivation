import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/foundation.dart';
import 'package:quotely/core/errors/errors.dart';

base class FirestoreConverter<T extends Object> {
  const FirestoreConverter();

  @nonVirtual
  @mustCallSuper
  T? fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    assert(MapperContainer.globals.get<T>() != null, '$T must be MappableObject');
    try {
      final data = snapshot.data();

      if (data == null || !snapshot.exists) return null;

      return MapperContainer.globals.fromMap<T>(data);
    } catch (e, s) {
      debugPrint('FirebaseConverter.fromFirestore - $T: $e, $s');
      rethrow;
    }
  }

  @nonVirtual
  @mustCallSuper
  Map<String, Object?> toFirestore(
    T? model,
    SetOptions? options,
  ) {
    try {
      assert(MapperContainer.globals.get<T>() != null, '$T must be MappableObject');
      if (model == null) {
        throw FirestoreException(errorMessage: 'Model is null - $T');
      }

      return MapperContainer.globals.toMap<T>(model);
    } on FirestoreException catch (e) {
      debugPrint('FirestoreConverter.toFirestore - FirestoreException: $e');
      rethrow;
    } catch (e, s) {
      debugPrint('FirebaseConverter.toFirestore - $T: $e, $s');
      rethrow;
    }
  }
}
