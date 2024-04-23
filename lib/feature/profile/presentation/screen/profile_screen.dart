import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:new_vime/core/colors/app_color.dart';
import 'package:new_vime/feature/home/presentation/bloc/providers/directionality_provider.dart';
import 'package:new_vime/feature/home/presentation/bloc/shared_cubit/theme_cubit/theme_cubit.dart';
import 'package:new_vime/feature/login/presentation/screen/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
          child: Text('Đăng xuất'),
          style: ButtonStyle(backgroundColor: ButtonState.all(AppColor.blue600)),
          onPressed: () {
            context.go('/login');
          },
        )
      ],
    );
  }
}
