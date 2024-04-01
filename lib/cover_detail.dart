import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamma/cover_detail_carousel.dart';
import 'package:gamma/data.dart';

class CoverDetailArguments {
  final CarouselType carouselType;
  final List<String> covers;
  final int index;
  const CoverDetailArguments(
      {required this.carouselType, required this.covers, required this.index});
}

class CoverDetail extends StatefulWidget {
  final CarouselType carouselType;
  final List<String> covers;
  final int index;
  const CoverDetail(
      {super.key,
      required this.carouselType,
      required this.covers,
      required this.index});

  @override
  State<CoverDetail> createState() => _CoverDetailState();
}

class _CoverDetailState extends State<CoverDetail> {
  late PageController _pageController;
  late int activePage;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _pageController =
        PageController(viewportFraction: 1, initialPage: widget.index);
    activePage = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          systemStatusBarContrastEnforced: true,
          statusBarColor: Colors.transparent),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              LimitedBox(
                maxHeight: size.height * 0.7,
                maxWidth: size.width,
                child: PageView.builder(
                    padEnds: false,
                    physics: const PageScrollPhysics(),
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.covers.length,
                    onPageChanged: (page) {
                      setState(() {
                        activePage = page;
                      });
                    },
                    itemBuilder: (_context, index) {
                      String cover = widget.covers[index];
                      return Stack(
                        children: [
                          Hero(
                            tag: widget.carouselType.string + cover,
                            child: Image.asset(
                              "assets/covers/$cover",
                              fit: BoxFit.fitWidth,
                              height: size.height * 0.7,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                          offset: Offset(0, 20),
                                          color: Color.fromARGB(206, 0, 0, 0),
                                          blurRadius: 45,
                                          spreadRadius: 100)
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                width: size.width * 0.8,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      CupertinoIcons.play_arrow_solid,
                                      size: 16,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Watch Now",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    }),
              ),
              indicators(activePage),
              const SizedBox(
                height: 10,
              ),
              CoverDetailCarousel(carouselType: widget.carouselType)
            ],
          ),
        ),
      ),
    );
  }

  Widget indicators(currentIndex) {
    var indicatorList = List<Widget>.generate(widget.covers.length, (index) {
      bool isActive = currentIndex == index;
      double dimension = isActive ? 10 : 6;
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
        width: dimension,
        height: dimension,
        decoration: BoxDecoration(
            color: currentIndex == index
                ? Colors.white
                : const Color.fromARGB(255, 134, 134, 134),
            shape: BoxShape.circle),
      );
    });
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: indicatorList,
    );
  }
}
