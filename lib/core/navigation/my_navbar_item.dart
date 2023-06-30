import 'package:event_app/common/utils/palette.dart';
import 'package:flutter/material.dart';

class MyNavbarItem extends StatelessWidget {
  const MyNavbarItem({
    required this.index,
    required this.selectedIndex,
    required this.label,
    required this.icon,
    super.key,
  });

  final int index;
  final ValueNotifier<int> selectedIndex;
  final String label;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: () {
        selectedIndex.value = index;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: selectedIndex.value == index
              ? Palette.bgIcon
              : Colors.transparent,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: selectedIndex.value == index
                    ? Palette.primary
                    : Palette.greyIcon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
