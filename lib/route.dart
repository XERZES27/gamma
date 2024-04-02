import 'package:flutter/material.dart';
import 'package:Gamma/cover_detail.dart';
import 'package:Gamma/home_screen.dart';
import 'package:Gamma/youtube_trailer_player.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/coverDetail':
        if (args is CoverDetailArguments) {
          return MaterialPageRoute(
            builder: (_) => CoverDetail(
              carouselType: args.carouselType,
              covers: args.covers,
              index: args.index,
            ),
          );
        }

        return _errorRoute();
      case '/youtubeScreen':
        if (args is String) {
          return MaterialPageRoute(builder: (_) => YoutubeScreen(link: args));
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
