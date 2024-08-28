import 'package:flutter/material.dart';

List<DateTime> generateSchedule({
  required List<int> weekDays,
  required List<TimeOfDay> times,
}) {
  final DateTime now = DateTime.now();
  final List<DateTime> schedule = [];

  // Önümüzdeki 4 hafta için
  for (int week = 0; week < 4; week++) {
    // Verilen haftanın günleri için
    for (final int dayIndex in weekDays) {
      // Eğer gün şuan ki günden küçükse, geç
      if (week == 0 && dayIndex < now.weekday) continue;

      // Belirtilen saatler için
      for (final TimeOfDay time in times) {
        DateTime scheduledDate = DateTime(
          now.year,
          now.month,
          now.day,
          time.hour,
          time.minute,
        );

        // Eğer bu haftadaysak ve gün şimdiki günse, sadece sonraki saatleri dahil et
        if (week == 0 && dayIndex == now.weekday) {
          if (time.hour < now.hour || (time.hour == now.hour && time.minute <= now.minute)) {
            continue;
          }
        }

        // Gün farkını hesapla
        int daysUntilTarget = dayIndex - now.weekday;
        if (daysUntilTarget < 0 || (daysUntilTarget == 0 && week > 0)) {
          daysUntilTarget += 7;
        }

        scheduledDate = scheduledDate.add(Duration(days: daysUntilTarget + (week * 7)));

        // Programı listeye ekle
        schedule.add(scheduledDate);
      }
    }
  }

  return schedule;
}

void main() {
  // Örnek kullanım
  final List<int> weekDays = [0, 1, 2, 3, 4, 5, 6]; // Pazar, Pazartesi, Salı, ...
  final List<TimeOfDay> times = [
    const TimeOfDay(hour: 16, minute: 00),
    const TimeOfDay(hour: 16, minute: 10),
    const TimeOfDay(hour: 16, minute: 20),
    const TimeOfDay(hour: 16, minute: 30),
    const TimeOfDay(hour: 16, minute: 40),
    const TimeOfDay(hour: 16, minute: 50),
    const TimeOfDay(hour: 17, minute: 00),
  ];

  final List<DateTime> schedule = generateSchedule(
    weekDays: weekDays,
    times: times,
  );

  // Çıktıyı göster
  for (final scheduledDate in schedule) {
    print('Index: ${schedule.indexOf(scheduledDate)} - Scheduled Date: $scheduledDate');
  }
}
