part of 'firestore_collections.dart';

mixin CollectionHelper<T extends Object> on Enum {
  CollectionReference<T?> get collection {
    return FirebaseFirestore.instance.collection(name).withConverter<T?>(
          fromFirestore: (T as FirestoreConverter<T>).fromFirestore,
          toFirestore: (T as FirestoreConverter<T>).toFirestore,
        );
  }
}
