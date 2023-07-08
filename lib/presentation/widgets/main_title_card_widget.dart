import 'package:flutter/material.dart';
import '../../core/constants.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w220_and_h330_face/r2J02Z2OpNTctfOSN1Ydgii51I3.jpg';


class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    super.key,
    required this.title
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 8,left: 10,right: 8,bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            title,
            style: const TextStyle(
              
              fontSize: 22,
              fontWeight: FontWeight.bold,
              
            ),
    
          ),
          kheight,
          SizedBox(
              height: size.width * 0.48,
              child: ListView.separated(
                shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Container(
                      width:  size.width * 0.35,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(imageUrl),
                      )),
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return kwidth;
                  },
                  itemCount: 10))
        ],
      ),
    );
  }
}