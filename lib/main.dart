import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import 'utils/logger.dart';
import 'routes/appPage.dart';
import 'theme/style.dart' as Themes;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Jendela Hukum',
      debugShowCheckedModeBanner: false,
      enableLog: true,
      logWriterCallback: Logger.write,
      theme: ThemeData(
        primaryColor: Themes.Colors.primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Themes.Colors.body,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          brightness: Brightness.dark
        ),
        primaryTextTheme: TextTheme(
          headline6: GoogleFonts.nunito()
        ),
        textTheme: GoogleFonts.nunitoTextTheme(
          Theme.of(context).textTheme
        )
      ),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes
    );
  }
}