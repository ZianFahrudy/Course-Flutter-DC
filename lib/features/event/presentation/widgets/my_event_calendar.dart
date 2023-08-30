import 'package:event_app/common/utils/typography.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../common/utils/calendar_utils.dart';
import '../../../../common/utils/palette.dart';

class MyEventCalendar extends StatefulWidget {
  const MyEventCalendar({super.key});

  @override
  State<MyEventCalendar> createState() => _MyEventCalendarState();
}

class _MyEventCalendarState extends State<MyEventCalendar> {
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: Color(0xffFCF1FF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: TableCalendar(
        shouldFillViewport: true,
        focusedDay: _focusedDay,
        firstDay: kFirstDay,
        lastDay: kLastDay,
        startingDayOfWeek: StartingDayOfWeek.monday,
        daysOfWeekStyle: DaysOfWeekStyle(
          weekendStyle:
              MyTypography.bodySmall.copyWith(color: Palette.secondary),
          weekdayStyle:
              MyTypography.bodySmall.copyWith(color: Palette.secondary),
        ),
        locale: 'id',
        headerStyle: HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
          titleTextStyle:
              MyTypography.bodyLarge.copyWith(color: Palette.secondary),
        ),
        calendarStyle: CalendarStyle(
          outsideDaysVisible: false,
          weekendTextStyle: MyTypography.bodyLarge.copyWith(color: Palette.red),
          defaultTextStyle:
              MyTypography.bodyLarge.copyWith(color: Palette.secondary),
          holidayDecoration:
              BoxDecoration(border: Border.all(color: Colors.transparent)),
          todayDecoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Palette.secondary,
          ),
          holidayTextStyle: const TextStyle(
            color: Palette.red,
          ),
        ),
      ),
    );
  }
}
