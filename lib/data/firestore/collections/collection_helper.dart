part of 'firestore_collections.dart';

mixin _CollectionHelper<T extends FirestoreConverter<T>> on Enum {
  CollectionReference<T?> get collection {
    return firestore.collection(name).withConverter<T?>(
          fromFirestore: (T as FirestoreConverter<T>).fromFirestore,
          toFirestore: (T as FirestoreConverter<T>).toFirestore,
        );
  }

  // For testing with FakeFirestore
  CollectionReference<Map<String, Object?>?> get collectionWithoutConverter {
    return firestore.collection(name);
  }

  FirebaseFirestore get firestore => locator<FirebaseFirestore>();
}
