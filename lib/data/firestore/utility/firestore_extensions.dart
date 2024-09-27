import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quotely/data/firestore/utility/firestore_converter.dart';

extension FirestoreCollectionExtensions on CollectionReference<Map<String, dynamic>> {
  CollectionReference<T?> getWithConverter<T extends FirestoreConverter<T>>() {
    return withConverter<T?>(
      fromFirestore: (T as FirestoreConverter<T>).fromFirestore,
      toFirestore: (T as FirestoreConverter<T>).toFirestore,
    );
  }
}

extension FirestoreDocumentExtensions<T extends Object> on DocumentReference<T> {
  DocumentReference<T?> getWithConverter() {
    return withConverter<T?>(
      fromFirestore: (T as FirestoreConverter<T>).fromFirestore,
      toFirestore: (T as FirestoreConverter<T>).toFirestore,
    );
  }
}
