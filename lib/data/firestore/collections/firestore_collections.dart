import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quotely/data/firestore/firestore_converter.dart';
import 'package:quotely/data/models/user_model/user_model.dart';

part 'collection_helper.dart';

enum FireStoreCollections<T extends FirestoreConverter<T>> with CollectionHelper<T> {
  users<UserModel>();

  const FireStoreCollections();
}
