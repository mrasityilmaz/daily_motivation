import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:quotely/data/firestore/firestore_converter.dart';
import 'package:quotely/data/models/firestore_models/user_model/user_model.dart';

part 'collection_helper.dart';

enum FireStoreCollections<T extends FirestoreConverter<T>> with CollectionHelper<T> {
  users<UserModel>();

  const FireStoreCollections();
}
