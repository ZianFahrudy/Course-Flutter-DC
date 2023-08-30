import 'package:event_app/features/event/presentation/widgets/my_event_calendar.dart';
import 'package:flutter/material.dart';

import '../widgets/my_event_appbar.dart';
import '../widgets/my_event_card.dart';
import '../widgets/my_event_tabbar.dart';

class MyEventPage extends StatelessWidget {
  const MyEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex =
        ValueNotifier<MyEventTabType>(MyEventTabType.allEvents);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const MyEventAppBar(),
            ValueListenableBuilder(
              valueListenable: selectedIndex,
              builder: (context, index, _) => Container(
                margin: const EdgeInsets.only(top: 80),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    MyEventTabBar(selectedIndex: selectedIndex),
                    if (selectedIndex.value == MyEventTabType.allEvents)
                      const MyEventCard(),
                    if (selectedIndex.value == MyEventTabType.upcoming)
                      const Center(
                        child: Text('Upcoming'),
                      ),
                    if (selectedIndex.value == MyEventTabType.calendar)
                      MyEventCalendar()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
