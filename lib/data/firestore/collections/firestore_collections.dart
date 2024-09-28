import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quotely/data/firestore/utility/firestore_converter.dart';
// ignore: unused_import
import 'package:quotely/data/firestore/utility/firestore_extensions.dart';
import 'package:quotely/data/models/firestore_models/user_model/user_model.dart';
import 'package:quotely/injection/injection_container.dart';

part 'collection_helper.dart';

enum FireStoreCollections<T extends Object> with _CollectionHelper<T> {
  users<UserModel>();

  const FireStoreCollections();
}
