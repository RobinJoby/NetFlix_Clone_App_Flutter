import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class HomeMainBar extends StatelessWidget {
  const HomeMainBar({
    super.key,
    
  });
 

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: size.width,
        height: 75,
        color: Colors.black.withOpacity(0.8),
        child: Column(
          children: [
            Row(
              children: [
                Image.network(
                  netflixImageUrl,
                  width: 45,
                  height: 45,
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.cast,
                      color: Colors.white,
                      size: 30,
                    )),
                kwidth,
                Container(
                  width: 30,
                  height: 30,
                  color: Colors.blue,
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'TV Shows',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Movies',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down_rounded,
                      color: Colors.white,
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}