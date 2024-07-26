// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuoteNotificationModelImpl _$$QuoteNotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$QuoteNotificationModelImpl(
      notificationId: json['notificationId'] as String,
      notificationCategories: (json['notificationCategories'] as List<dynamic>)
          .map((e) => $enumDecode(_$CategoriesEnumMap, e))
          .toList(),
      notificationDaysInWeek: (json['notificationDaysInWeek'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      notificationEqualSchedule: json['notificationEqualSchedule'] == null
          ? null
          : QuoteNotificationEqualScheduleModel.fromJson(
              json['notificationEqualSchedule'] as Map<String, dynamic>),
      notificationCustomIntervalSchedule:
          json['notificationCustomIntervalSchedule'] == null
              ? null
              : QuoteNotificationScheduleCustomIntervalModel.fromJson(
                  json['notificationCustomIntervalSchedule']
                      as Map<String, dynamic>),
    );

Map<String, dynamic> _$$QuoteNotificationModelImplToJson(
        _$QuoteNotificationModelImpl instance) =>
    <String, dynamic>{
      'notificationId': instance.notificationId,
      'notificationCategories': instance.notificationCategories
          .map((e) => _$CategoriesEnumMap[e]!)
          .toList(),
      'notificationDaysInWeek': instance.notificationDaysInWeek,
      'notificationEqualSchedule': instance.notificationEqualSchedule,
      'notificationCustomIntervalSchedule':
          instance.notificationCustomIntervalSchedule,
    };

const _$CategoriesEnumMap = {
  Categories.general: 'general',
  Categories.favorites: 'favorites',
  Categories.myquotes: 'myquotes',
  Categories.art: 'art',
  Categories.dreams: 'dreams',
  Categories.enjoythemoment: 'enjoythemoment',
  Categories.imagination: 'imagination',
  Categories.inspirational: 'inspirational',
  Categories.life: 'life',
  Categories.music: 'music',
  Categories.newbeginnings: 'newbeginnings',
  Categories.thankful: 'thankful',
  Categories.time: 'time',
  Categories.bestrong: 'bestrong',
  Categories.education: 'education',
  Categories.courage: 'courage',
  Categories.experience: 'experience',
  Categories.growth: 'growth',
  Categories.learning: 'learning',
  Categories.motivational: 'motivational',
  Categories.power: 'power',
  Categories.beyourself: 'beyourself',
  Categories.startchange: 'startchange',
  Categories.equality: 'equality',
  Categories.faith: 'faith',
  Categories.freedom: 'freedom',
  Categories.minimalism: 'minimalism',
  Categories.patience: 'patience',
  Categories.philosophy: 'philosophy',
  Categories.positivethinking: 'positivethinking',
  Categories.trust: 'trust',
  Categories.truth: 'truth',
  Categories.wisdom: 'wisdom',
  Categories.business: 'business',
  Categories.computer: 'computer',
  Categories.entrepreneurs: 'entrepreneurs',
  Categories.finance: 'finance',
  Categories.intelligence: 'intelligence',
  Categories.leadership: 'leadership',
  Categories.money: 'money',
  Categories.success: 'success',
  Categories.technology: 'technology',
  Categories.work: 'work',
  Categories.bodybuilding: 'bodybuilding',
  Categories.health: 'health',
  Categories.loveyourself: 'loveyourself',
  Categories.selfdiscipline: 'selfdiscipline',
  Categories.sports: 'sports',
  Categories.strength: 'strength',
  Categories.weightloss: 'weightloss',
  Categories.workout: 'workout',
  Categories.chance: 'chance',
  Categories.knowledge: 'knowledge',
  Categories.funny: 'funny',
  Categories.history: 'history',
  Categories.pet: 'pet',
  Categories.poetry: 'poetry',
  Categories.science: 'science',
  Categories.space: 'space',
  Categories.travel: 'travel',
  Categories.communication: 'communication',
  Categories.dating: 'dating',
  Categories.fallinglove: 'fallinglove',
  Categories.family: 'family',
  Categories.friendship: 'friendship',
  Categories.jealousy: 'jealousy',
  Categories.marriage: 'marriage',
  Categories.relations: 'relations',
  Categories.romantic: 'romantic',
  Categories.society: 'society',
  Categories.attitude: 'attitude',
  Categories.forgiveness: 'forgiveness',
  Categories.calm: 'calm',
  Categories.happiness: 'happiness',
  Categories.hope: 'hope',
  Categories.innerpeace: 'innerpeace',
  Categories.nature: 'nature',
  Categories.respect: 'respect',
  Categories.sympathy: 'sympathy',
  Categories.angercontrol: 'angercontrol',
  Categories.dissappointment: 'dissappointment',
  Categories.failure: 'failure',
  Categories.fear: 'fear',
  Categories.haters: 'haters',
  Categories.heartbroken: 'heartbroken',
  Categories.loneliness: 'loneliness',
  Categories.pain: 'pain',
  Categories.sadness: 'sadness',
  Categories.uncertainty: 'uncertainty',
  Categories.god: 'god',
  Categories.religion: 'religion',
};

_$QuoteNotificationEqualScheduleModelImpl
    _$$QuoteNotificationEqualScheduleModelImplFromJson(
            Map<String, dynamic> json) =>
        _$QuoteNotificationEqualScheduleModelImpl(
          notificationStartTime:
              _timeOfDayFromJson(json['notificationStartTime'] as String?),
          notificationEndTime:
              _timeOfDayFromJson(json['notificationEndTime'] as String?),
          notificationInterval: (json['notificationInterval'] as num?)?.toInt(),
          notificationSchedules:
              _listTimeOfDayFromJson(json['notificationSchedules'] as String?),
        );

Map<String, dynamic> _$$QuoteNotificationEqualScheduleModelImplToJson(
        _$QuoteNotificationEqualScheduleModelImpl instance) =>
    <String, dynamic>{
      'notificationStartTime': _timeOfDayToJson(instance.notificationStartTime),
      'notificationEndTime': _timeOfDayToJson(instance.notificationEndTime),
      'notificationInterval': instance.notificationInterval,
      'notificationSchedules':
          _listTimeOfDayToJson(instance.notificationSchedules),
    };

_$QuoteNotificationScheduleCustomIntervalModelImpl
    _$$QuoteNotificationScheduleCustomIntervalModelImplFromJson(
            Map<String, dynamic> json) =>
        _$QuoteNotificationScheduleCustomIntervalModelImpl(
          notificationSchedules:
              _listTimeOfDayFromJson(json['notificationSchedules'] as String?),
        );

Map<String, dynamic> _$$QuoteNotificationScheduleCustomIntervalModelImplToJson(
        _$QuoteNotificationScheduleCustomIntervalModelImpl instance) =>
    <String, dynamic>{
      'notificationSchedules':
          _listTimeOfDayToJson(instance.notificationSchedules),
    };
