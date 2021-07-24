import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart' as GTrans;
import '../screen/bottomNavigation.dart';

part  'appRoute.dart';

class AppPages {
  static final initial = Routes.MAIN;
  static final routes = [
    GetPage(
        name: Routes.MAIN,
        page: () => BottomNavigation(),
        transition: GTrans.Transition.zoom,
        transitionDuration: Duration(milliseconds: 700)
      ),
      // GetPage(
      //   name: Routes.LOGIN,
      //   page: () => LoginScreen(),
      //   transition: GTrans.Transition.leftToRightWithFade
      // )
  ];
}