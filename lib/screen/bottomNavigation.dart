import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:test_tony/theme/style.dart' as Theme;
import 'package:test_tony/icons/linearIcons.dart';
import 'package:test_tony/screen/about/index.dart';
import 'package:test_tony/screen/news/index.dart';
import 'package:test_tony/widget/snackbar.dart';

DateTime? currentBackPressTime;

class BottomNavigation extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => BottomNavigation());
  }

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  var _buildScreens;

  @override
  void initState() {
    _buildScreens = [
      NewsScreen(),
      AboutScreen()
    ];
    super.initState();
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null || now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Snackbar.info("Tekan 2 kali untuk keluar dari aplikasi");

      return Future.value(false);
    }

    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: onWillPop,
        child: _buildScreens[_selectedIndex]
      ),
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: LinearIcons.book, title: 'Berita'),
          TabItem(icon: LinearIcons.star, title: 'Tentang'),
        ],
        elevation: 5.0,
        color: Colors.grey,
        backgroundColor: Colors.white,
        activeColor: Theme.Colors.primary,
        style: TabStyle.reactCircle,
        top: -15.0,
        curveSize: 65.0,
        initialActiveIndex: _selectedIndex,
        onTap: (int i) => setState(() {
          _selectedIndex = i;
        })
      ),
    );
  }
}