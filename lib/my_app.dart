import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_profile/presentation/splash/splash_screen.dart';
import 'package:dynamic_color/dynamic_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final _defaultLightColorScheme = ColorScheme.fromSwatch(backgroundColor: Colors.white70);
  static  final _defaultDarkColorScheme = ColorScheme.fromSwatch(backgroundColor: Colors.black87, brightness: Brightness.dark);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return DynamicColorBuilder(
      builder: (lightColorScheme, darkColorScheme){
        return  GetMaterialApp(
          theme: ThemeData(
            // This is the theme of your application.
            //
            // TRY THIS: Try running your application with "flutter run". You'll see
            // the application has a blue toolbar. Then, without quitting the app,
            // try changing the seedColor in the colorScheme below to Colors.green
            // and then invoke "hot reload" (save your changes or press the "hot
            // reload" button in a Flutter-supported IDE, or press "r" if you used
            // the command line to start the app).
            //
            // Notice that the counter didn't reset back to zero; the application
            // state is not lost during the reload. To reset the state, use hot
            // restart instead.
            //
            // This works for code too, not just values: Most code changes can be
            // tested with just a hot reload.
            colorScheme: lightColorScheme ?? _defaultLightColorScheme,
            fontFamily: GoogleFonts.rubik().fontFamily,
            useMaterial3: true,

          ),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme ?? _defaultDarkColorScheme,
            fontFamily: GoogleFonts.rubik().fontFamily,
            useMaterial3: true,
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}

