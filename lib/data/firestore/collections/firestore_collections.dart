import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quotely/data/firestore/firestore_converter.dart';
import 'package:quotely/data/models/firestore_models/user_model/user_model.dart';
import 'package:quotely/injection/injection_container.dart';

part 'collection_helper.dart';

enum FireStoreCollections<T extends FirestoreConverter<T>> with _CollectionHelper<T> {
  users<UserModel>();

  const FireStoreCollections();
}
