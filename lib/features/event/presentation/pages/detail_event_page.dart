// ignore_for_file: lines_longer_than_80_chars

import 'package:auto_size_text/auto_size_text.dart';
import 'package:event_app/common/utils/palette.dart';
import 'package:event_app/common/utils/typography.dart';
import 'package:event_app/components/empty/nothing.dart';
import 'package:event_app/core/di/injection.dart';
import 'package:event_app/features/event/domain/entities/event_entity.dart';
import 'package:event_app/features/event/presentation/bloc/event_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailEventPage extends StatefulWidget {
  const DetailEventPage({super.key});

  @override
  State<DetailEventPage> createState() => _DetailEventPageState();
}

class _DetailEventPageState extends State<DetailEventPage> {
  final eventBloc = sl<EventBloc>();

  @override
  void initState() {
    final eventId = Get.arguments as String;

    eventBloc.add(GetDetailEventEvent(body: int.parse(eventId)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => eventBloc,
      child: Scaffold(
        body: BlocBuilder<EventBloc, EventState>(
          builder: (context, state) {
            if (state is DetailEventSuccess) {
              return SafeArea(
                child: Column(
                  children: [
                    HeaderDetailEvent(
                      data: state.response.data,
                    ),
                    if (state.response.data.isJoin == 'true')
                      const JoinAndAbsenButton(),
                    AboutEvent(
                      about: state.response.data.eventAbout,
                    ),
                    TimeEvent(
                      data: state.response.data,
                    ),
                    DescriptionEvent(
                      desc: state.response.data.eventDesc,
                    ),
                  ],
                ),
              );
            } else if (state is EventFailure) {
              return Center(
                child: Text(state.message),
              );
            } else if (state is EventLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const Nothing();
            }
          },
        ),
      ),
    );
  }
}

class DescriptionEvent extends StatelessWidget {
  const DescriptionEvent({
    required this.desc,
    super.key,
  });

  final String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Palette.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Apa yang Dibahas',
            style: MyTypography.bodyLarge.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Html(
            data: desc,
          ),
          // Text(
          //   desc,
          //   style: MyTypography.labelMedium.copyWith(color: Palette.greyText),
          // ),
        ],
      ),
    );
  }
}

class TimeEvent extends StatelessWidget {
  const TimeEvent({
    required this.data,
    super.key,
  });

  final EventEntity data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Palette.grey),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const FaIcon(
                FontAwesomeIcons.solidCalendar,
                size: 12,
                color: Palette.greyText,
              ),
              const SizedBox(width: 10),
              Text(
                DateFormat('dd MMMM yyyy', 'ID')
                    .format(DateTime.parse(data.eventDate)),
                style:
                    MyTypography.labelSmall.copyWith(color: Palette.greyText),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const FaIcon(
                FontAwesomeIcons.solidClock,
                size: 12,
                color: Palette.greyText,
              ),
              const SizedBox(width: 10),
              Text(
                '${data.eventStartTime.substring(0, data.eventStartTime.length - 3)} WIB - Selesai',
                style:
                    MyTypography.labelSmall.copyWith(color: Palette.greyText),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const FaIcon(
                FontAwesomeIcons.solidMap,
                size: 12,
                color: Palette.greyText,
              ),
              const SizedBox(width: 10),
              Text(
                'Google Meet',
                style:
                    MyTypography.labelSmall.copyWith(color: Palette.greyText),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class AboutEvent extends StatelessWidget {
  const AboutEvent({
    required this.about,
    super.key,
  });

  final String about;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Palette.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tentang',
            style: MyTypography.bodyLarge.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            about,
            style: MyTypography.bodySmall.copyWith(color: Palette.greyText),
          ),
        ],
      ),
    );
  }
}

class JoinAndAbsenButton extends StatelessWidget {
  const JoinAndAbsenButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(),
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text('Join Meet Now'),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: OutlinedButton(
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text('Absen'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderDetailEvent extends StatelessWidget {
  const HeaderDetailEvent({
    required this.data,
    super.key,
  });

  final EventEntity data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.topLeft,
            height: 110,
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
            width: double.infinity,
            color: Palette.bgDetail1,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.back<void>();
                  },
                  child: const FaIcon(
                    FontAwesomeIcons.chevronLeft,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 30),
                Text(
                  'Detail',
                  style: MyTypography.titleLarge
                      .copyWith(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 80,
              width: double.infinity,
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 55,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Palette.greyAvatar,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: data.mentor.mentorAvatar == ''
                            ? const Placeholder()
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  data.mentor.mentorAvatar,
                                  fit: BoxFit.fill,
                                ),
                              ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: Get.width - 220,
                              child: AutoSizeText(
                                data.eventName,
                                maxLines: 2,
                                minFontSize: 9,
                                overflow: TextOverflow.ellipsis,
                                style: MyTypography.bodyMedium,
                              ),
                            ),
                          ),
                          Text(
                            data.mentor.mentorName,
                            style: MyTypography.bodySmall.copyWith(fontSize: 9),
                          ),
                          SizedBox(
                            width: Get.width - 150,
                            child: AutoSizeText(
                              '${data.mentor.mentorJob} at ${data.mentor.mentorCompany}',
                              maxLines: 2,
                              minFontSize: 7,
                              overflow: TextOverflow.ellipsis,
                              style: MyTypography.labelSmall,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailEventAppBar extends StatelessWidget {
  const DetailEventAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      height: 110,
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
      width: double.infinity,
      color: Palette.bgDetail1,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Get.back<void>();
            },
            child: const FaIcon(
              FontAwesomeIcons.chevronLeft,
              size: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 30),
          Text(
            'Detail',
            style: MyTypography.titleLarge
                .copyWith(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
