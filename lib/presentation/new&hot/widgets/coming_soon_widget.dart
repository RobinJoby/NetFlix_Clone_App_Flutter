import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone_app/core/colors/colors.dart';
import 'package:netflix_clone_app/core/constants.dart';
import 'package:netflix_clone_app/presentation/FastLaugh/widgets/video_list_item.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (ctx, index) {
        return const ComingSoonListItem();
      },
      separatorBuilder: (ctx, index) {
        return kheight;
      },
      itemCount: 15,
    );
  }
}

class ComingSoonListItem extends StatelessWidget {
  const ComingSoonListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(7.0, 20, 7, 0),
        child: Row(
          children: [
            SizedBox(
              width: 60,
              height: 500,
              child: Column(
                children: [
                  Text(
                    'FEB',
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: kcolorGrey,
                          letterSpacing: 2),
                    ),
                  ),
                  Text(
                    '11',
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                height: 450,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 180,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(newAndHotTempImage),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          right: 8,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.black.withOpacity(0.8),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.volume_off,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    kheigth20,
                    Row(
                      children: [
                        Text('TALL GIRL 2',
                            style: GoogleFonts.amaticSc(
                              textStyle: const TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -2,
                                  wordSpacing: -2),
                            )),
                        const Spacer(),
                        const VideoActionWidget(
                          icon: Icons.notifications_none_outlined,
                          title: 'Remind Me',
                          iconSize: 25,
                          textSize: 13,
                        ),
                        kwidth20,
                        const VideoActionWidget(
                          icon: Icons.info_outline,
                          title: 'info',
                          iconSize: 25,
                          textSize: 13,
                        ),
                        kwidth
                      ],
                    ),
                    const Text(
                      'Coming on Friday',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    kheigth20,
                    const Text(
                      'Tall Girl 2',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    kheight,
                    const Text(
                      'Leading the lead in the school musical is a dream come true for Jodi, until the pressure sends her confidence - and her relationship - into a tallspin.',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      //overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
