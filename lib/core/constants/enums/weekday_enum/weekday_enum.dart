enum WeekdayEnum {
  monday(dayIndex: 0, shortNameEn: 'Mon', shortNameTr: 'Pzt'),
  tuesday(dayIndex: 1, shortNameEn: 'Tue', shortNameTr: 'Sal'),
  wednesday(dayIndex: 2, shortNameEn: 'Wed', shortNameTr: 'Çar'),
  thursday(dayIndex: 3, shortNameEn: 'Thu', shortNameTr: 'Per'),
  friday(dayIndex: 4, shortNameEn: 'Fri', shortNameTr: 'Cum'),
  saturday(dayIndex: 5, shortNameEn: 'Sat', shortNameTr: 'Cmt'),
  sunday(dayIndex: 6, shortNameEn: 'Sun', shortNameTr: 'Paz');

  const WeekdayEnum({required this.dayIndex, required this.shortNameEn, required this.shortNameTr});

  final int dayIndex;
  final String shortNameEn;
  final String shortNameTr;
}
