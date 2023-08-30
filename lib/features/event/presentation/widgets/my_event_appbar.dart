import 'package:event_app/common/utils/palette.dart';
import 'package:event_app/common/utils/typography.dart';
import 'package:event_app/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MyEventAppBar extends StatelessWidget {
  const MyEventAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 60),
      color: Palette.primary,
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Dunia Coding',
            style: MyTypography.bodyMedium.copyWith(color: Colors.white),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Get.toNamed<void>(RoutesName.searchEventPage);
            },
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const FaIcon(
                FontAwesomeIcons.magnifyingGlass,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
          const SizedBox(width: 10),
          const CircleAvatar(
            backgroundImage: NetworkImage(
              'https://cdn1-production-images-kly.akamaized.net/GThpK29xMOyzhJMHajflep4CF9E=/1200x1200/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/1439641/original/042027300_1482131661-reddit.jpg',
            ),
          ),
        ],
      ),
    );
  }
}
