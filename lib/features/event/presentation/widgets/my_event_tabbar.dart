import 'package:event_app/common/utils/palette.dart';
import 'package:event_app/common/utils/typography.dart';
import 'package:flutter/material.dart';

enum MyEventTabType { allEvents, upcoming, calendar }

class MyEventTabBar extends StatelessWidget {
  const MyEventTabBar({
    required this.selectedIndex,
    super.key,
  });

  final ValueNotifier<MyEventTabType> selectedIndex;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<MyEventTabType>(
      valueListenable: selectedIndex,
      builder: (context, index, _) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                selectedIndex.value = MyEventTabType.allEvents;
              },
              child: Chip(
                backgroundColor: selectedIndex.value == MyEventTabType.allEvents
                    ? Palette.purpleTab
                    : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: selectedIndex.value == MyEventTabType.allEvents
                        ? Palette.purpleTab
                        : Palette.greyBorder,
                  ),
                ),
                label: Text(
                  'All Events',
                  style: MyTypography.bodyMedium.copyWith(
                    color: selectedIndex.value == MyEventTabType.allEvents
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                selectedIndex.value = MyEventTabType.upcoming;
              },
              child: Chip(
                backgroundColor: selectedIndex.value == MyEventTabType.upcoming
                    ? Palette.purpleTab
                    : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: selectedIndex.value == MyEventTabType.upcoming
                        ? Palette.purpleTab
                        : Palette.greyBorder,
                  ),
                ),
                label: Text(
                  'Upcoming Events',
                  style: MyTypography.bodyMedium.copyWith(
                    color: selectedIndex.value == MyEventTabType.upcoming
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                selectedIndex.value = MyEventTabType.calendar;
              },
              child: Chip(
                backgroundColor: selectedIndex.value == MyEventTabType.calendar
                    ? Palette.purpleTab
                    : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: selectedIndex.value == MyEventTabType.calendar
                        ? Palette.purpleTab
                        : Palette.greyBorder,
                  ),
                ),
                label: Text(
                  'Calendar',
                  style: MyTypography.bodyMedium.copyWith(
                    color: selectedIndex.value == MyEventTabType.calendar
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
