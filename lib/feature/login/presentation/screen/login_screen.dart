import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_vime/core/colors/app_color.dart';
import 'package:new_vime/feature/home/presentation/bloc/providers/directionality_provider.dart';
import 'package:new_vime/feature/home/presentation/bloc/shared_cubit/theme_cubit/theme_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.scrollable(
      // backgroundColor: Colors.white,

      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: SizedBox.fromSize(
            size: const Size.fromRadius(20),
            child: IconButton(
              //  iconSize: 25,
              icon: Icon(FluentIcons.library
                  //   Icons.light,
                  // color: AppColor.backgroundColorDark,
                  ),
              onPressed: () {
                //  context.read<ThemeCubit>().switchTheme();
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
              icon: Icon(FluentIcons.library

                  // Icons.language_outlined,
                  // color: AppColor.backgroundColorDark,
                  ),
              onPressed: () {
                // context.read<DirectionalityProvider>().switchDirection();
              },
            ),
          ),
        ),
        FilledButton(
          child: const Text('Filled Button'),
          onPressed: () => debugPrint('pressed button'),
        )
      ],
    );
  }
}
