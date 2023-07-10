import 'package:flutter/material.dart';
import 'package:netflix_clone_app/presentation/home/widgets/main_image_action_widget.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
const imageUrl =
    'https://www.themoviedb.org/t/p/w220_and_h330_face/vrQHDXjVmbYzadOXQ0UaObunoy2.jpg';


class MainImageWidget extends StatelessWidget {
  const MainImageWidget({
    super.key,
    
  });



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(right: 8,left: 8),
      child: Stack(
        children: [
          
          Column(
            children: [
              kheight73,
              Container(
                width: size.width,
                height: size.width * 1.1,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(imageUrl),
                  ),
                ),
              ),
              kheight55
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
                    backgroundColor:
                        MaterialStatePropertyAll(kcolorWhite),
                  ),
                ),
                
                const MainImageActionWidget(icon: Icons.info_outline, title: 'Info')
              ],
            ),
          )
        ],
      ),
    );
  }
}