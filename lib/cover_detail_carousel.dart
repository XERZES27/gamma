import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Gamma/cover_detail.dart';
import 'package:Gamma/data.dart';

class CoverDetailCarousel extends StatefulWidget {
  final CarouselType carouselType;
  const CoverDetailCarousel({super.key, required this.carouselType});

  @override
  State<CoverDetailCarousel> createState() => _CoverDetailCarouselState();
}

class _CoverDetailCarouselState extends State<CoverDetailCarousel> {
  PageController _pageController = PageController(viewportFraction: 0.41);
  final int lengthOfCovers = covers.length;
  final List<String> _covers = [...covers];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.carouselType.shouldShuffle) {
      _covers.shuffle();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool showPlayButton = widget.carouselType.showPlayButton;
    Orientation orientation = MediaQuery.of(context).orientation;
    bool isPortrait = orientation == Orientation.portrait;
    _pageController = PageController(viewportFraction: isPortrait ? 0.41 : 0.2);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            widget.carouselType.string,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 5),
        LimitedBox(
          maxWidth: size.width,
          maxHeight: 200,
          child: PageView.builder(
              padEnds: false,
              physics: const PageScrollPhysics(),
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              itemCount: lengthOfCovers,
              itemBuilder: (_context, index) {
                String cover = _covers[index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      '/coverDetail',
                      arguments: CoverDetailArguments(
                          carouselType: widget.carouselType,
                          covers: _covers,
                          index: index),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(
                            "assets/covers/$cover",
                            height: 200,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        if (showPlayButton)
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Container(
                                height: 35,
                                decoration: const BoxDecoration(boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 5),
                                      color: Color.fromARGB(101, 0, 0, 0),
                                      blurRadius: 10,
                                      spreadRadius: 15)
                                ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'S${Random().nextInt(6) + 1}:E${Random().nextInt(24) + 1}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: LinearProgressIndicator(
                                        value: Random().nextRangedDouble(.3, 1),
                                        backgroundColor:
                                            const Color(0xff666767),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(2)),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        if (showPlayButton)
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              clipBehavior: Clip.hardEdge,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(69, 248, 248, 248),
                                  shape: BoxShape.circle),
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: const Icon(
                                  CupertinoIcons.play_arrow_solid,
                                  size: 35,
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                );
              }),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}

extension RandomExtension on Random {
  double nextRangedDouble(double min, double max) {
    return (nextDouble() * (max - min) + min);
  }
}
