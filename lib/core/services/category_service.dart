import 'package:daily_motivation/data/models/category_static_model/category_static_model.dart';
import 'package:flutter/foundation.dart';

@immutable
final class CategoryStaticService {
  factory CategoryStaticService() => _instance;

  const CategoryStaticService._internal();

  static const CategoryStaticService _instance = CategoryStaticService._internal();

  static List<CategoryStaticModel> get categories => _categories;
  static final List<CategoryStaticModel> _categories = [
    CategoryStaticModel(
      title: 'general',
      subCategories: _categoryMap.entries
          .where((element) => ['0', '1', '2'].contains(element.key))
          .map((e) => CategoryStaticSubModel(title: e.value, categoryImage: 'assets/category_icons/${e.key}.webp', categoryId: e.key, isPremium: false))
          .toList()
        ..sort((a, b) => a.isPremium ? 1 : 0),
    ),
    CategoryStaticModel(
      title: 'inspirational',
      subCategories: _categoryMap.entries
          .where((element) => ['3', '4', '5', '6', '7', '8', '9', '10', '11', '12'].contains(element.key))
          .map(
            (e) => CategoryStaticSubModel(title: e.value, categoryImage: 'assets/category_icons/${e.key}.webp', categoryId: e.key, isPremium: !['3', '4', '5'].contains(e.key)),
          )
          .toList()
        ..sort((a, b) => a.isPremium ? 1 : 0),
    ),
    CategoryStaticModel(
      title: 'personal_impovement',
      subCategories: _categoryMap.entries
          .where((element) => ['13', '14', '15', '16', '17', '18', '19', '20', '21', '22'].contains(element.key))
          .map(
            (e) => CategoryStaticSubModel(title: e.value, categoryImage: 'assets/category_icons/${e.key}.webp', categoryId: e.key, isPremium: !['13', '14', '19'].contains(e.key)),
          )
          .toList()
        ..sort((a, b) => a.isPremium ? 1 : 0),
    ),
    CategoryStaticModel(
      title: 'spiritual',
      subCategories: _categoryMap.entries
          .where((element) => ['23', '24', '25', '26', '27', '28', '29', '30', '31', '32'].contains(element.key))
          .map(
            (e) => CategoryStaticSubModel(title: e.value, categoryImage: 'assets/category_icons/${e.key}.webp', categoryId: e.key, isPremium: !['23', '24', '25'].contains(e.key)),
          )
          .toList()
        ..sort((a, b) => a.isPremium ? 1 : 0),
    ),
    CategoryStaticModel(
      title: 'business_and_productivity',
      subCategories: _categoryMap.entries
          .where((element) => ['33', '34', '35', '36', '37', '38', '39', '40', '41', '42'].contains(element.key))
          .map(
            (e) => CategoryStaticSubModel(title: e.value, categoryImage: 'assets/category_icons/${e.key}.webp', categoryId: e.key, isPremium: !['34', '36', '39'].contains(e.key)),
          )
          .toList()
        ..sort((a, b) => a.isPremium ? 1 : 0),
    ),
    CategoryStaticModel(
      title: 'health_and_fitness',
      subCategories: _categoryMap.entries
          .where((element) => ['43', '44', '45', '46', '47', '48', '49', '50', '51', '52'].contains(element.key))
          .map(
            (e) => CategoryStaticSubModel(title: e.value, categoryImage: 'assets/category_icons/${e.key}.webp', categoryId: e.key, isPremium: !['43', '44', '51'].contains(e.key)),
          )
          .toList()
        ..sort((a, b) => a.isPremium ? 1 : 0),
    ),
    CategoryStaticModel(
      title: 'interesting',
      subCategories: _categoryMap.entries
          .where((element) => ['53', '54', '55', '56', '57', '58', '59', '60', '61', '62'].contains(element.key))
          .map(
            (e) => CategoryStaticSubModel(title: e.value, categoryImage: 'assets/category_icons/${e.key}.webp', categoryId: e.key, isPremium: !['58', '56', '55'].contains(e.key)),
          )
          .toList()
        ..sort((a, b) => a.isPremium ? 1 : 0),
    ),
    CategoryStaticModel(
      title: 'relationships',
      subCategories: _categoryMap.entries
          .where((element) => ['63', '64', '65', '66', '67', '68', '69', '70', '71', '72'].contains(element.key))
          .map(
            (e) => CategoryStaticSubModel(title: e.value, categoryImage: 'assets/category_icons/${e.key}.webp', categoryId: e.key, isPremium: !['72', '66', '63'].contains(e.key)),
          )
          .toList()
        ..sort((a, b) => a.isPremium ? 1 : 0),
    ),
    CategoryStaticModel(
      title: 'calm',
      subCategories: _categoryMap.entries
          .where((element) => ['73', '74', '75', '76', '77', '78', '79', '80', '81', '82'].contains(element.key))
          .map(
            (e) => CategoryStaticSubModel(
              title: e.value,
              categoryImage: 'assets/category_icons/${e.key}.webp',
              categoryId: e.key,
              isPremium: !['75', '79', '82'].contains(e.key),
            ),
          )
          .toList()
        ..sort((a, b) => a.isPremium ? 1 : 0),
    ),
    CategoryStaticModel(
      title: 'hard_times',
      subCategories: _categoryMap.entries
          .where((element) => ['83', '84', '85', '86', '87', '88', '89', '90', '91', '92'].contains(element.key))
          .map(
            (e) => CategoryStaticSubModel(title: e.value, categoryImage: 'assets/category_icons/${e.key}.webp', categoryId: e.key, isPremium: !['89', '90', '88'].contains(e.key)),
          )
          .toList()
        ..sort((a, b) => a.isPremium ? 1 : 0),
    ),
    CategoryStaticModel(
      title: 'religion',
      subCategories: _categoryMap.entries
          .where((element) => ['93', '94', '95', '96', '97', '98', '99', '100', '101', '102'].contains(element.key))
          .map(
            (e) => CategoryStaticSubModel(title: e.value, categoryImage: 'assets/category_icons/${e.key}.webp', categoryId: e.key, isPremium: !['99', '100', '101'].contains(e.key)),
          )
          .toList()
        ..sort((a, b) => a.isPremium ? 1 : 0),
    ),
  ];

  static const Map<String, String> _categoryMap = {
    '0': 'General',
    '1': 'Favorites',
    '2': 'My Quotes',
    '3': 'Art',
    '4': 'Dreams',
    '5': 'Enjoy the moment',
    '6': 'Imagination',
    '7': 'Inspirational',
    '8': 'Life',
    '9': 'Music',
    '10': 'New Beginnings',
    '11': 'Thankful',
    '12': 'Time',
    '13': 'Be Strong',
    '14': 'Education',
    '15': 'Courage',
    '16': 'Experience',
    '17': 'Growth',
    '18': 'Learning',
    '19': 'Motivational',
    '20': 'Power',
    '21': 'Be Yourself',
    '22': 'Start Change',
    '23': 'Equality',
    '24': 'Faith',
    '25': 'Freedom',
    '26': 'Minimalism',
    '27': 'Patience',
    '28': 'Philosophy',
    '29': 'Positive Thinking',
    '30': 'Trust',
    '31': 'Truth',
    '32': 'Wisdom',
    '33': 'Business',
    '34': 'Computer',
    '35': 'Entrepreneurs',
    '36': 'Finance',
    '37': 'Intelligence',
    '38': 'Leadership',
    '39': 'Money',
    '40': 'Success',
    '41': 'Technology',
    '42': 'Work',
    '43': 'Bodybuilding',
    '44': 'Health',
    '45': 'Love Yourself',
    '46': 'Medical',
    '47': 'No Excuses',
    '48': 'Self-Discipline',
    '49': 'Sports',
    '50': 'Strength',
    '51': 'Weight loss',
    '52': 'Work out',
    '53': 'Chance',
    '54': 'Knowledge',
    '55': 'Funny',
    '56': 'Short Quotes',
    '57': 'History',
    '58': 'Pet',
    '59': 'Poetry',
    '60': 'Science',
    '61': 'Space',
    '62': 'Travel',
    '63': 'Communication',
    '64': 'Dating',
    '65': 'Falling Love',
    '66': 'Family',
    '67': 'Friendship',
    '68': 'Jealousy',
    '69': 'Marriage',
    '70': 'Relations',
    '71': 'Romantic',
    '72': 'Society',
    '73': 'Attitude',
    '74': 'Forgiveness',
    '75': 'Calm',
    '76': 'Happiness',
    '77': 'Hope',
    '78': 'İnner Peace',
    '79': 'Nature',
    '80': 'Patience',
    '81': 'Respect',
    '82': 'Sympathy',
    '83': 'Anger Control',
    '84': 'Dissappointment',
    '85': 'Failure',
    '86': 'Fear',
    '87': 'Haters',
    '88': 'Heartbroken',
    '89': 'Loneliness',
    '90': 'Pain',
    '91': 'Sadness',
    '92': 'Uncertainty',
    '93': 'Bible Verses',
    '94': 'Buddhism',
    '95': 'God',
    '96': 'Hinduism',
    '97': 'Jewish',
    '98': 'Paganism',
    '99': 'Quran Hadiths',
    '100': 'Quran Verses',
    '101': 'Religion',
    '102': 'Taoism',
    '103': 'Boost',
  };
}
