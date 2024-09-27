part of 'firestore_collections.dart';

mixin _CollectionHelper<T extends FirestoreConverter<T>> on Enum {
  CollectionReference<T?> get collection {
    return firestore.collection(name).getWithConverter<T>();
  }

  // For testing with FakeFirestore
  CollectionReference<Map<String, Object?>?> get collectionWithoutConverter {
    return firestore.collection(name);
  }

  FirebaseFirestore get firestore => locator<FirebaseFirestore>();
}
