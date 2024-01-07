import 'package:flutter/foundation.dart';

@immutable
final class CategoryStaticModel {
  const CategoryStaticModel({required this.title, required this.subCategories});

  final String title;
  final List<CategoryStaticSubModel> subCategories;
}

@immutable
final class CategoryStaticSubModel {
  const CategoryStaticSubModel({required this.title, required this.categoryImage, required this.categoryId, required this.isPremium});

  final String title;

  final String categoryImage;

  final String categoryId;

  final bool isPremium;
}
