import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamma/cover_detail.dart';
import 'package:gamma/home_screen.dart';
import 'package:gamma/route.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();

   await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
      overlays: []);
  runApp(const Gamma());
}

class Gamma extends StatelessWidget {
  const Gamma({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gamma',
      debugShowCheckedModeBanner: false,
      builder: (_context, child) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
                systemNavigationBarIconBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.light,
                statusBarBrightness: Brightness.dark,
                statusBarColor: Color(0xff090909),
                systemNavigationBarColor: Color(0xff090909)),
            child: child!);
      },
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      
      
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff090909),
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xff090909),
          onBackground: Colors.white,
          onPrimary: Colors.white,
        ),
        useMaterial3: true,
      ),
    );
  }
}
