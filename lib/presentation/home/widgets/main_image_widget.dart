import 'package:flutter/material.dart';
import 'package:netflix_clone_app/presentation/home/widgets/main_image_action_widget.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constant_strings.dart';
import '../../../core/constants.dart';



class MainImageWidget extends StatelessWidget {
  const MainImageWidget({
    super.key,
    required this.posterPath,
  });

  final String posterPath;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
 
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8),
      child: Stack(
        children: [
          Column(
            children: [
              kheight73,
              SizedBox(
                width: size.width,
                height: size.width * 1.1,
                child: Image.network(
                  '$imageAppendUrl$posterPath',
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      );
                    }
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(Icons.error_outline_rounded),
                    );
                  },
                ),
              ),
              kheight65
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const MainImageActionWidget(icon: Icons.add, title: 'My List'),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.play_arrow_rounded,
                    color: kcolorBlack,
                    size: 30,
                  ),
                  label: const Text(
                    'Play',
                    style: TextStyle(
                        color: kcolorBlack,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 10)),
                    backgroundColor: MaterialStatePropertyAll(kcolorWhite),
                  ),
                ),
                const MainImageActionWidget(
                    icon: Icons.info_outline, title: 'Info')
              ],
            ),
          )
        ],
      ),
    );
  }
}
