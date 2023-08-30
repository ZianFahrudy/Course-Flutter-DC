import 'package:event_app/common/utils/palette.dart';
import 'package:event_app/common/utils/typography.dart';
import 'package:flutter/material.dart';

class MyEventCard extends StatelessWidget {
  const MyEventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 119,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 110,
              child: Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: const [
                    TopContent(),
                    BottomContent(),
                  ],
                ),
              ),
            ),
          ),
          const LabelStatus()
        ],
      ),
    );
  }
}

class LabelStatus extends StatelessWidget {
  const LabelStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: const EdgeInsets.only(left: 22),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
        decoration: BoxDecoration(
          color: Palette.green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          'Live',
          style: MyTypography.labelSmall
              .copyWith(color: Colors.white, fontSize: 10),
        ),
      ),
    );
  }
}

class BottomContent extends StatelessWidget {
  const BottomContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: Row(
        children: [
          //image
          Container(
            width: 50,
            decoration: BoxDecoration(
              color: Palette.greyAvatar,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Lorem ipsum lorem', style: MyTypography.bodyMedium),
              Text(
                'Lorem ipsum lorem',
                style: MyTypography.bodySmall,
              ),
              Text(
                'Lorem ipsum lorem',
                style: MyTypography.labelSmall,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class TopContent extends StatelessWidget {
  const TopContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: const BoxDecoration(
        color: Palette.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
      width: double.infinity,
      child: Row(
        children: [
          const Icon(
            Icons.school,
            size: 15,
            color: Colors.white,
          ),
          const SizedBox(width: 5),
          Text(
            'lorem ipsum lorem',
            style: MyTypography.bodySmall.copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}
