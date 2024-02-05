import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class IHiveBoxService<E> {
  IHiveBoxService({required this.box});

  final Box<E> box;

  @mustCallSuper
  Future<void> clearBox() async {
    await box.clear();
  }

  @mustCallSuper
  Future<void> initBox() async {
    await Hive.openBox<E>(box.name);
  }
}
