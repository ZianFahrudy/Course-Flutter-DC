import 'package:event_app/common/utils/palette.dart';
import 'package:event_app/common/utils/typography.dart';
import 'package:event_app/features/information/domain/entities/information_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeInformationCard extends StatelessWidget {
  const HomeInformationCard({
    required this.data,
    required this.index,
    super.key,
  });
  final int index;
  final List<InformationEntity> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: IntrinsicHeight(
        child: Row(
          children: [
            const SizedBox(
              height: 58,
              child: VerticalDivider(
                color: Colors.purple,
                thickness: 3,
                width: 0,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Get.width - 55,
                  child: Text(
                    data[index].informationTitle,
                    maxLines: 2,
                    style: MyTypography.bodyMedium
                        .copyWith(color: Palette.primary),
                  ),
                ),
                Text(
                  DateFormat('dd MMMM yyyy', 'ID')
                      .format(DateTime.parse(data[index].informationDate)),
                  style: MyTypography.labelSmall
                      .copyWith(color: Palette.greylabel),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
