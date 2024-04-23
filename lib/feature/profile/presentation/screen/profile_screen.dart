import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_vime/core/colors/app_color.dart';
import 'package:new_vime/feature/home/presentation/bloc/providers/directionality_provider.dart';
import 'package:new_vime/feature/home/presentation/bloc/shared_cubit/theme_cubit/theme_cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: SizedBox.fromSize(
              size: const Size.fromRadius(20),
              child: IconButton(
                iconSize: 25,
                icon: Icon(
                  Icons.light,
                  color: AppColor.backgroundColorDark,
                ),
                onPressed: () {
                  context.read<ThemeCubit>().switchTheme();
                },
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: SizedBox.fromSize(
              size: const Size.fromRadius(20),
              child: IconButton(
                //   iconSize: 25,
                icon: Icon(
                  Icons.language_outlined,
                  color: AppColor.backgroundColorDark,
                ),
                onPressed: () {
                  context.read<DirectionalityProvider>().switchDirection();
                },
              ),
            ),
          ),
          // Button(
          //   child: const Text('Standard Button'),
          //   onPressed: () => debugPrint('pressed button'),
          // )
        ],
      ),
    );
  }
}
