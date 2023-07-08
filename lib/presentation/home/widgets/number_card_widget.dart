import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/hBUdnylt2a84PwGIPQcZDkCVB5M.jpg';

class NumberCardWidget extends StatelessWidget {
  const NumberCardWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 10, right: 8, bottom: 8),
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
                    return Stack(
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 40,
                            ),
                            Container(
                              width: size.width * 0.35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(imageUrl),
                                  )),
                            ),
                          ],
                        ),
                        Positioned(
                            left: 2,
                            top: 90,
                            bottom: 0,
                            child: Stack(
                              children: <Widget>[
                                // Stroked text as border.
                                Text(
                                  '${index+1}',
                                  
                                  style: GoogleFonts.roboto(textStyle: TextStyle(
                                    
                                    fontSize: 100,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 5
                                      ..color = Colors.white54,
                                  ),)
                                ),
                                // Solid text as fill.
                                Text(
                                  '${index+1}',
                                  style:GoogleFonts.roboto(textStyle:const TextStyle(
                                    
                                    fontSize: 100,
                                    color: Colors.black,
                                  ),)
                                ),
                              ],
                            ))
                      ],
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
