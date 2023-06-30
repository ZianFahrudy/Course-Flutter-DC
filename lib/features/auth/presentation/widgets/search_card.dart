import 'package:event_app/common/utils/palette.dart';
import 'package:event_app/common/utils/typography.dart';
import 'package:event_app/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 75, left: 10, right: 10),
      child: Card(
        elevation: 3,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: Palette.grey,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Get.toNamed<void>(RoutesName.searchEventPage);
          },
          child: Container(
            margin: const EdgeInsets.all(2),
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 15,
                  color: Palette.grey,
                ),
                const SizedBox(width: 10),
                Text(
                  'Cari Event',
                  style: MyTypography.bodyMedium.copyWith(
                    color: Palette.grey,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
