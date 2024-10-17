import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:quotely/data/firebase/utility/firestore_converter.dart';
import 'package:quotely/data/models/firestore_models/user_model/user_model.dart';
import 'package:quotely/injection/injection_container.dart';

part 'collection_helper.dart';

enum FireStoreCollections<T extends Object> with _CollectionHelper<T> {
  users<UserModel>();

  const FireStoreCollections();
}
