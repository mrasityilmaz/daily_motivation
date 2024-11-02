part of 'firestore_collections.dart';

mixin _CollectionHelper<T extends Object> on Enum {
  CollectionReference<T?> get collection {
    final converter = FirestoreConverter<T>();
    return firestore.collection(name).withConverter<T?>(
          fromFirestore: converter.fromFirestore,
          toFirestore: converter.toFirestore,
        );
  }

  /// For testing with FakeFirestore
  CollectionReference<Map<String, Object?>?> get fakeCollectionWithoutConverter {
    return firestore.collection(name);
  }

  @protected
  FirebaseFirestore get firestore => locator<FirebaseFirestore>();
}
