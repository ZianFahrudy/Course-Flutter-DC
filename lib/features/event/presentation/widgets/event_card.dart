// ignore_for_file: lines_longer_than_80_chars

import 'package:event_app/common/utils/palette.dart';
import 'package:event_app/common/utils/typography.dart';
import 'package:event_app/core/routes/routes.dart';
import 'package:event_app/features/event/domain/entities/event_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    required this.data,
    required this.index,
    super.key,
  });
  final int index;
  final List<EventEntity> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Stack(
        children: [
          // card
          Container(
            height: 210,
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 200,
              child: Card(
                elevation: 3,
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    Get.toNamed<void>(
                      RoutesName.detailEventPage,
                      arguments: data[index].eventId,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TopContent(
                          label: data[index].eventLabel,
                          name: data[index].eventName,
                          date: data[index].eventDate,
                          startDate: data[index].eventStartTime,
                          endDate: data[index].eventEndTime,
                        ),
                        BottomContent(
                          data: data[index],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          //label status
          LabelStatus(
            status: data[index].status,
          )
        ],
      ),
    );
  }
}

class LabelStatus extends StatelessWidget {
  const LabelStatus({
    required this.status,
    super.key,
  });

  final String status;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 40,
      child: Container(
        alignment: Alignment.center,
        height: 25,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          boxShadow: const [BoxShadow(color: Palette.secondary, blurRadius: 2)],
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          status,
          style: MyTypography.labelSmall.copyWith(
            color: Palette.primary,
          ),
        ),
      ),
    );
  }
}

class BottomContent extends StatelessWidget {
  const BottomContent({
    required this.data,
    super.key,
  });

  final EventEntity data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 55,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Palette.secondary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundImage: data.mentor.mentorAvatar == ''
                ? null
                : NetworkImage(data.mentor.mentorAvatar),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                data.mentor.mentorName,
                style: MyTypography.bodySmall.copyWith(color: Colors.white),
              ),
              SizedBox(
                width: Get.width - 220,
                child: Text(
                  '${data.mentor.mentorJob} at ${data.mentor.mentorCompany}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: MyTypography.labelSmall.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
          const Spacer(),
          if (data.isJoin == 'false')
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: const Size(80, 30),
              ),
              onPressed: () {},
              child: Text(
                'JOIN',
                style: MyTypography.labelSmall.copyWith(color: Palette.primary),
              ),
            )
        ],
      ),
    );
  }
}

class TopContent extends StatelessWidget {
  const TopContent({
    required this.label,
    required this.name,
    required this.date,
    required this.startDate,
    required this.endDate,
    super.key,
  });

  final String label;
  final String name;
  final String date;
  final String startDate;
  final String endDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Palette.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.school,
                size: 18,
                color: Colors.white,
              ),
              const SizedBox(width: 5),
              Text(
                label,
                style: MyTypography.bodySmall.copyWith(color: Colors.white),
              )
            ],
          ),
          SizedBox(
            width: Get.width - 80,
            child: Text(
              name,
              maxLines: 2,
              style: MyTypography.titleMedium.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          const Spacer(),
          Text(
            DateFormat('dd MMMM yyyy', 'ID').format(DateTime.parse(date)),
            style: MyTypography.labelSmall.copyWith(color: Colors.white),
          ),
          Text(
            '${startDate.substring(0, startDate.length - 3)} - ${endDate.substring(0, endDate.length - 3)} WIB',
            style: MyTypography.labelSmall.copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}
