import 'package:daily_motivation/core/constants/categories_enum.dart';
import 'package:easy_localization/easy_localization.dart';

enum CategoryGroup {
  general('general', []),
  inspirational('inspirational', [
    Categories.art,
    Categories.dreams,
    Categories.enjoythemoment,
    // Premiums
    Categories.imagination,
    Categories.inspirational,
    Categories.life,
    Categories.music,
    Categories.newbeginnings,
    Categories.thankful,
    Categories.time,
  ]),
  personalimprovement('personal_improvement', [
    Categories.bestrong,
    Categories.education,
    Categories.motivational,
    // Premiums
    Categories.courage,
    Categories.experience,
    Categories.growth,
    Categories.learning,
    Categories.power,
    Categories.beyourself,
    Categories.startchange,
  ]),
  spiritual('spiritual', [
    Categories.equality,
    Categories.faith,
    Categories.freedom,
    // Premiums
    Categories.minimalism,
    Categories.patience,
    Categories.philosophy,
    Categories.positivethinking,
    Categories.trust,
    Categories.truth,
    Categories.wisdom,
  ]),
  businessandproductivity('business_and_productivity', [
    Categories.computer,
    Categories.money,
    Categories.finance,
    // Premiums
    Categories.business,
    Categories.entrepreneurs,
    Categories.intelligence,
    Categories.leadership,
    Categories.success,
    Categories.technology,
    Categories.work,
  ]),
  healthandfitness('health_and_fitness', [
    Categories.bodybuilding,
    Categories.health,
    Categories.weightloss,
    // Premiums
    Categories.loveyourself,
    Categories.selfdiscipline,
    Categories.sports,
    Categories.strength,
    Categories.workout,
  ]),
  interesting('interesting', [
    Categories.funny,
    Categories.pet,
    Categories.space,
    // Premiums
    Categories.chance,
    Categories.knowledge,
    Categories.history,
    Categories.poetry,
    Categories.science,
    Categories.travel,
  ]),
  relationships('relationships', [
    Categories.communication,
    Categories.family,
    Categories.society,
    // Premiums
    Categories.dating,
    Categories.fallinglove,
    Categories.friendship,
    Categories.jealousy,
    Categories.marriage,
    Categories.relations,
    Categories.romantic,
  ]),
  calm('calm', [
    Categories.calm,
    Categories.nature,
    Categories.sympathy,
    // Premiums
    Categories.attitude,
    Categories.forgiveness,
    Categories.happiness,
    Categories.hope,
    Categories.innerpeace,
    Categories.respect,
  ]),
  hardtimes('hard_times', [
    Categories.heartbroken,
    Categories.loneliness,
    Categories.pain,
    // Premiums
    Categories.angercontrol,
    Categories.dissappointment,
    Categories.failure,
    Categories.fear,
    Categories.haters,
    Categories.sadness,
    Categories.uncertainty,
  ]),
  religion('religion', [
    Categories.god,
    Categories.religion,
  ]);

  final String key;

  String get name => 'category_titles.$key'.tr();

  final List<Categories> subCategories;

  const CategoryGroup(this.key, this.subCategories);
}
