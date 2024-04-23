import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_vime/core/colors/app_color.dart';
import 'package:new_vime/feature/home/presentation/bloc/shared_cubit/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:new_vime/main.dart';

class MainBottomNavigationBar extends StatelessWidget {
  final double height;
  const MainBottomNavigationBar({Key? key, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: height,
      padding: const EdgeInsets.all(0),
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            border: Border(
                top: BorderSide(
              width: 0.5,
              color: isDark
                  ? AppColor.bottomNavigationBarDividerColorDark
                  : AppColor.bottomNavigationBarDividerColorLight,
            ))),
        child: BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox.fromSize(
                  size: const Size.fromRadius(25),
                  child: IconButton(
                    padding: const EdgeInsets.all(0.0),
                    splashRadius: 20,
                    splashColor: const Color(0xff0694d7),
                    color: isDark ? Colors.white : Colors.black,
                    icon: Icon(state.activeIcon == ActiveIcon.icon1
                        ? Icons.calendar_month
                        : Icons.calendar_month_outlined),
                    onPressed: () {
                      context
                          .read<BottomNavigationBarCubit>()
                          .setActiveIcon(ActiveIcon.icon1);
                    },
                  ),
                ),
                SizedBox.fromSize(
                  size: const Size.fromRadius(25),
                  child: IconButton(
                    padding: const EdgeInsets.all(0.0),
                    splashRadius: 20,
                    splashColor: const Color(0xff0694d7),
                    color: isDark ? Colors.white : Colors.black,
                    icon: Icon(state.activeIcon == ActiveIcon.icon2
                        ? Icons.house
                        : Icons.house_outlined),
                    onPressed: () {
                      context
                          .read<BottomNavigationBarCubit>()
                          .setActiveIcon(ActiveIcon.icon2);
                    },
                  ),
                ),
                SizedBox.fromSize(
                  size: const Size.fromRadius(25),
                  child: IconButton(
                    padding: const EdgeInsets.all(0.0),
                    splashRadius: 20,
                    splashColor: const Color(0xff0694d7),
                    color: isDark ? Colors.white : Colors.black,
                    icon: Icon(state.activeIcon == ActiveIcon.icon3
                        ? Icons.home_work
                        : Icons.home_work_outlined),
                    onPressed: () {
                      context
                          .read<BottomNavigationBarCubit>()
                          .setActiveIcon(ActiveIcon.icon3);
                    },
                  ),
                ),
                SizedBox.fromSize(
                  size: const Size.fromRadius(25),
                  child: IconButton(
                    padding: const EdgeInsets.all(0.0),
                    splashRadius: 20,
                    splashColor: const Color(0xff0694d7),
                    color: isDark ? Colors.white : Colors.black,
                    icon: Icon(state.activeIcon == ActiveIcon.icon4
                        ? Icons.person
                        : Icons.person_outlined),
                    onPressed: () {
                      context
                          .read<BottomNavigationBarCubit>()
                          .setActiveIcon(ActiveIcon.icon4);
                    },
                  ),
                ),
                // SizedBox.fromSize(
                //   size: const Size.fromRadius(25),
                //   child: IconButton(
                //     padding: const EdgeInsets.all(0.0),
                //     splashRadius: 20,
                //     splashColor: const Color(0xff0694d7),
                //     color: isDark ? Colors.white : Colors.black,
                //     icon: Container(
                //       width: state.activeIcon == ActiveIcon.icon5 ? 28 : 26,
                //       height: state.activeIcon == ActiveIcon.icon5 ? 28 : 26,
                //       decoration: BoxDecoration(
                //         border: Border.all(
                //             color: isDark
                //                 ? AppColor.bottomNavigationBarDividerColorDark
                //                 : state.activeIcon == ActiveIcon.icon5
                //                     ? Colors.black
                //                     : AppColor
                //                         .bottomNavigationBarDividerColorLight,
                //             width: state.activeIcon == ActiveIcon.icon5
                //                 ? 2.0
                //                 : 1.0),
                //         borderRadius:
                //             const BorderRadius.all(Radius.circular(30)),
                //       ),
                //       child: Container(
                //         decoration: const BoxDecoration(
                //           borderRadius: BorderRadius.all(Radius.circular(30)),
                //         ),
                //         clipBehavior: Clip.antiAlias,
                //         child: Image.asset("assets/images/avatar.jpg"),
                //       ),
                //     ),
                //     onPressed: () {
                //       context
                //           .read<BottomNavigationBarCubit>()
                //           .setActiveIcon(ActiveIcon.icon5);
                //     },
                //   ),
                // ),
              ],
            );
          },
        ),
      ),
    );
  }
}
