import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/constant_strings.dart';
import '../../core/constants.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    super.key,
    required this.title,
    required this.posterPathList,
  });

  final String title;
  final List<String> posterPathList;

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
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        '$imageAppendUrl${posterPathList[index]}',
                        width: size.width * 0.35,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return SizedBox(
                              width: size.width * 0.35,
                              child: const Center(
                                  child: CircularProgressIndicator(
                                strokeWidth: 2,
                              )),
                            );
                          }
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return  SizedBox(
                             width: size.width * 0.35,
                            child:  const Center(
                              child: Icon(
                                Icons.error_outline_rounded,
                                color: Colors.white,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return kwidth;
                  },
                  itemCount: posterPathList.length))
        ],
      ),
    );
  }
}
