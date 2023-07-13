import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone_app/application/download/download_bloc.dart';
import 'package:netflix_clone_app/core/colors/colors.dart';
import 'package:netflix_clone_app/core/constant_strings.dart';
import 'package:netflix_clone_app/core/constants.dart';
import 'package:netflix_clone_app/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  const ScreenDownloads({super.key});

  final _widgetList = const [
    _SmartDownloads(),
    Section2(),
    Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: 'Downloads',
          ),
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(10),
          itemBuilder: (ctx, index) {
            return _widgetList[index];
          },
          separatorBuilder: (ctx, index) {
            return const SizedBox(
              height: 25,
            );
          },
          itemCount: _widgetList.length,
        ));
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kButtonColorBlue[700],
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Set up',
                style: TextStyle(
                    color: kcolorWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ),
        ),
        kheight,
        MaterialButton(
          color: kButtonColorWhite,
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              'See what you can download',
              style: TextStyle(
                  color: kcolorBlack,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        BlocProvider.of<DownloadBloc>(context)
            .add(const DownloadEvent.getDownloadImage());
      },
    );
    return Column(
      children: [
        const Text(
          'Introducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kcolorWhite,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        kheight,
        const Text(
          'We\'ll download personalised selection of\n movies and shows for you, so there is\n always something to watch on your\n device',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kcolorGrey, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        BlocBuilder<DownloadBloc, DownloadState>(
          builder: (context, state) {
            if(state.isLoading)
            {
              return SizedBox(
                width: size.width,
                height: size.width,
                child: const Center(child: CircularProgressIndicator(),),
              );
            }
            else if(state.isError)
            {
              return SizedBox(
                width: size.width,
                height: size.width,
                child: const Center(child: Text('Oops! Something went wrong'),),
              );
            }
            return SizedBox(
              width: size.width,
              height: size.width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 117, 113, 113),
                    radius: size.width * 0.35,
                  ),
                  DownloadImageWidget(
                    size: Size(size.width * 0.3, size.width * 0.5),
                    imageList: '$imageAppendUrl${state.downloadList[2].posterPath}',
                    margin: const EdgeInsets.only(
                      left: 170,
                      bottom: 30,
                    ),
                    angle: 17,
                  ),
                  DownloadImageWidget(
                    size: Size(size.width * 0.3, size.width * 0.5),
                    imageList: '$imageAppendUrl${state.downloadList[1].posterPath}',
                    margin: const EdgeInsets.only(
                      right: 170,
                      bottom: 30,
                    ),
                    angle: -17,
                  ),
                  DownloadImageWidget(
                    size: Size(size.width * 0.35, size.width * 0.55),
                    imageList: '$imageAppendUrl${state.downloadList[0].posterPath}',
                    margin: const EdgeInsets.only(bottom: 0),
                    borderRadius: 5,
                  ),
                  // const Padding(
                  //   padding:  EdgeInsets.only(top: 210),
                  //   child:  Icon(Icons.add,color: Colors.red,),
                  // )
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        kwidth,
        Icon(
          Icons.settings,
          color: kcolorWhite,
        ),
        kwidth,
        Text(
          'Smart Downloads',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        )
      ],
    );
  }
}

class DownloadImageWidget extends StatelessWidget {
  const DownloadImageWidget(
      {super.key,
      required this.imageList,
      required this.margin,
      required this.size,
      this.borderRadius = 7,
      this.angle = 0});

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          margin: margin,
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageList),
            ),
          ),
        ),
      ),
    );
  }
}
