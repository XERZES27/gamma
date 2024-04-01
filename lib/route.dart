import 'package:flutter/material.dart';
import 'package:gamma/cover_detail.dart';
import 'package:gamma/home_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/coverDetail':
        if  (args is CoverDetailArguments ) {
          return MaterialPageRoute(
            builder: (_) => CoverDetail(
                  carouselType: args.carouselType,
                  covers: args.covers,
                  index: args.index,
                ),
          );
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