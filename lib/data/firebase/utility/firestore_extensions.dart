

// extension FirestoreCollectionExtensions on CollectionReference<Map<String, dynamic>> {
//   CollectionReference<T?> getWithConverter<T extends FirestoreConverter>() {
//     print('T: $T');
//     print('T: ${T is FirestoreConverter<T>}');
//     print('T: ${T.runtimeType}');

//     return withConverter<T?>(
//       fromFirestore: (T as FirestoreConverter).fromFirestore as T Function(
//           DocumentSnapshot<Map<String, dynamic>>, SnapshotOptions?),
//       toFirestore: (model, options) => (T as FirestoreConverter<T>).toFirestore(model, options),
//     );
//   }
// }

// extension FirestoreDocumentExtensions<T extends Object> on DocumentReference<T> {
//   DocumentReference<T?> getWithConverter() {
//     return withConverter<T?>(
//       fromFirestore: (T as FirestoreConverter<T>).fromFirestore,
//       toFirestore: (T as FirestoreConverter<T>).toFirestore,
//     );
//   }
// }
