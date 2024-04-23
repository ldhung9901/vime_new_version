import 'dart:math';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:new_vime/core/colors/app_color.dart';
import 'package:new_vime/core/utils/screen_sizes.dart';
import 'package:new_vime/feature/home/presentation/bloc/providers/directionality_provider.dart';
import 'package:new_vime/feature/home/presentation/bloc/shared_cubit/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:new_vime/feature/home/presentation/widget/main_bottom_navigation_bar.dart';
import 'package:new_vime/feature/profile/presentation/screen/profile_screen.dart';
import 'package:new_vime/main.dart';

class MainWrapperScreen extends StatefulWidget {
  const MainWrapperScreen({
    super.key,
  });

  @override
  State<MainWrapperScreen> createState() => _MainWrapperScreenState();
}

class _MainWrapperScreenState extends State<MainWrapperScreen> {
  final TextEditingController textEditingController = TextEditingController();
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      systemNavigationBarColor: isDark ? AppColor.bottomNavigationBarDark : AppColor.bottomNavigationBarLight,
    ));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double bottomNavigationBarHeight = (MediaQuery.of(context).viewInsets.bottom > 0) ? 0 : 50;
    double appBarHeight = ScreenSize.setScreenHeight(context, 0.1);
    if (appBarHeight < 95) appBarHeight = 95;
    double minHeightBox = ScreenSize.setScreenHeight(context, 0.3) - bottomNavigationBarHeight;
    double maxHeightBox = ScreenSize.fullHeightScreen(context) - appBarHeight - bottomNavigationBarHeight;
    return Scaffold(
      // backgroundColor: Colors.white,
      body: BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
        builder: (_, bottomNavigationState) {
          if (bottomNavigationState.activeIcon == ActiveIcon.icon1) {
            return Container();
          } else if (bottomNavigationState.activeIcon == ActiveIcon.icon2) {
            return Container();
          } else if (bottomNavigationState.activeIcon == ActiveIcon.icon3) {
            return Container();
          } else if (bottomNavigationState.activeIcon == ActiveIcon.icon4) {
            return const ProfileScreen();
          } else if (bottomNavigationState.activeIcon == ActiveIcon.icon5) {
            return SizedBox(
              height: 150,
              child: Center(
                child: Text(
                  "The user profile can be found here",
                  // style:
                  //     TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
              ),
            );
          }
          return Container();
        },
      ),
      bottomNavigationBar: MainBottomNavigationBar(height: bottomNavigationBarHeight),
    );
    // return ScaffoldPage(
    //   content: TabView(
    //     tabs: [
    //       Tab(
    //         text: Text('Document 1'),
    //         icon: const FlutterLogo(),
    //         body: Container(
    //           color: Colors.accentColors[Random().nextInt(Colors.accentColors.length)],
    //         ),
    //       ),
    //       Tab(
    //         text: Text('Document 1'),
    //         icon: const FlutterLogo(),
    //         body: Container(
    //           color: Colors.accentColors[Random().nextInt(Colors.accentColors.length)],
    //         ),
    //       ),
    //       Tab(
    //         text: Text('Document 1'),
    //         icon: const FlutterLogo(),
    //         body: Container(
    //           color: Colors.accentColors[Random().nextInt(Colors.accentColors.length)],
    //         ),
    //       ),
    //       Tab(
    //         text: Text('Document 1'),
    //         icon: const FlutterLogo(),
    //         body: Container(
    //           color: Colors.accentColors[Random().nextInt(Colors.accentColors.length)],
    //         ),
    //       ),
    //     ],
    //     currentIndex: currentIndex,
    //     onChanged: (index) => setState(() => currentIndex = index),
    //     tabWidthBehavior: TabWidthBehavior.equal,
    //     closeButtonVisibility: CloseButtonVisibilityMode.always,
    //     // showScrollButtons: true,
    //   ),
    // );
  }
}
