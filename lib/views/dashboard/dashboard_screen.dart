import 'package:fancy_bottom_navigation_plus/fancy_bottom_navigation_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutterlpsetest/helper/network_info.dart';
import 'package:flutterlpsetest/views/dashboard/widget/sign_out_confirmation_dialog.dart';
import 'package:flutterlpsetest/views/home/home_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _pageIndex = 0;

  final PageController _pageController = PageController();
  late List<Widget> _screens;

  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();
  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _screens = [
      HomePage(),
      HomePage(),
      HomePage(),
      HomePage(),
      const SignOutConfirmationDialog(),
    ];
    NetworkInfo.checkConnectivity(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_pageIndex != 0) {
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        body: PageView.builder(
          controller: _pageController,
          itemCount: _screens.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _screens[index];
          },
        ),
        bottomNavigationBar: FancyBottomNavigationPlus(
          tabs: [
            TabData(icon: const Icon(Icons.home), title: "Home"),
            TabData(icon: const Icon(Icons.message), title: "Inbox"),
            TabData(icon: const Icon(Icons.newspaper_outlined), title: "Inbox"),
            TabData(
                icon: const Icon(Icons.notification_add),
                title: "Notification"),
            TabData(icon: const Icon(Icons.exit_to_app), title: "Log Out"),
          ],
          initialSelection: 0,
          key: bottomNavigationKey,
          onTabChangedListener: (int index) {
            _pageController.jumpToPage(index);
            _pageIndex = index;
          },
        ),
      ),
    );
  }
}
