import 'package:flutter/material.dart';
import '../../../core/colors/colors.dart';


class MainImageActionWidget extends StatelessWidget {
  const MainImageActionWidget({super.key,required this.icon,required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Icon(icon,color: kcolorWhite,size: 30,),
          Text(title,style: const TextStyle(color: kcolorWhite,fontSize: 16),),
          
        ],
      ),
    );
  }
}