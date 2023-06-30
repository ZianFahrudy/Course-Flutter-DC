// ignore_for_file: lines_longer_than_80_chars

import 'package:event_app/common/utils/palette.dart';
import 'package:event_app/common/utils/typography.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class DetailEventPage extends StatelessWidget {
  const DetailEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            HeaderDetailEvent(),
            JoinAndAbsenButton(),
            AboutEvent(),
            TimeEvent(),
            DescriptionEvent(),
          ],
        ),
      ),
    );
  }
}

class DescriptionEvent extends StatelessWidget {
  const DescriptionEvent({
    super.key,
  });

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
          Row(
            children: [
              const FaIcon(
                FontAwesomeIcons.check,
                size: 15,
                color: Palette.primary,
              ),
              const SizedBox(width: 10),
              Text(
                'Pengenalan Product Management',
                style:
                    MyTypography.labelMedium.copyWith(color: Palette.greyText),
              ),
            ],
          ),
          Row(
            children: [
              const FaIcon(
                FontAwesomeIcons.check,
                size: 15,
                color: Palette.primary,
              ),
              const SizedBox(width: 10),
              Text(
                'Pengenalan Product Management',
                style:
                    MyTypography.labelMedium.copyWith(color: Palette.greyText),
              ),
            ],
          ),
          Row(
            children: [
              const FaIcon(
                FontAwesomeIcons.check,
                size: 15,
                color: Palette.primary,
              ),
              const SizedBox(width: 10),
              Text(
                'Pengenalan Product Management',
                style:
                    MyTypography.labelMedium.copyWith(color: Palette.greyText),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TimeEvent extends StatelessWidget {
  const TimeEvent({
    super.key,
  });

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
                '19 Desember 2022',
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
                '19.30 WIB - Selesai',
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
    super.key,
  });

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
            'Lorem ipsum lorem ipsum Lorem ipsum lorem ipsum Lorem ipsum lorem ipsum Lorem ipsum lorem ipsum Lorem ipsum lorem ipsum Lorem ipsum lorem ipsum Lorem ipsum lorem ipsum Lorem ipsum lorem ipsumLorem ipsum lorem ipsum Lorem ipsum lorem ipsum Lorem ipsum lorem ipsum Lorem ipsum lorem ipsum',
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
    super.key,
  });

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
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            'https://static.wikia.nocookie.net/heros/images/5/52/Kakashi_Hatake_Infobox.png/revision/latest?cb=20210514165627&path-prefix=fr',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Slicing UI Design with Flutter',
                            style: MyTypography.bodyMedium,
                          ),
                          Text(
                            'Hatake Kakashi',
                            style: MyTypography.bodySmall,
                          ),
                          Text(
                            'Jonin Shinobi at KONOHA',
                            style: MyTypography.labelSmall,
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
