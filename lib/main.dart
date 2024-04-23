// App Theme is Light
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_vime/core/config/language_detector.dart';
import 'package:new_vime/core/themes/theme_detector.dart';
import 'package:new_vime/feature/home/presentation/bloc/providers/directionality_provider.dart';
import 'package:new_vime/feature/home/presentation/bloc/shared_cubit/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:new_vime/feature/home/presentation/bloc/shared_cubit/directionality_cubit/directionality_cubit.dart';
import 'package:new_vime/feature/home/presentation/bloc/shared_cubit/theme_cubit/theme_cubit.dart';
import 'package:new_vime/feature/home/presentation/screen/main_wrapper_screen.dart';
import 'package:new_vime/injection_container.dart';
import 'package:provider/provider.dart';

bool isDark = false;
// App Direction is left to right
bool isLtr = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //  return MultiBlocProvider(
    //   providers: [
    //     BlocProvider<DirectionalityCubit>(
    //         create: (context) => locator<DirectionalityCubit>()),
    //     BlocProvider<BottomNavigationBarCubit>(
    //         create: (context) => locator<BottomNavigationBarCubit>()),
    //   ],
    //   child: ChangeNotifierProvider.value(
    //     value: _appTheme,
    //     builder: (context, child) {
    //       final appTheme = context.watch<AppTheme>();
    //       return FluentApp(
    //         //  title: appTitle,
    //         themeMode: appTheme.mode,
    //         debugShowCheckedModeBanner: false,
    //         color: appTheme.colors,
    //         darkTheme: FluentThemeData(
    //           brightness: Brightness.dark,
    //           accentColor: appTheme.colors,
    //           visualDensity: VisualDensity.standard,
    //           focusTheme: FocusThemeData(
    //             glowFactor: is10footScreen(context) ? 2.0 : 0.0,
    //           ),
    //         ),
    //         theme: FluentThemeData(
    //           accentColor: appTheme.colors,
    //           visualDensity: VisualDensity.standard,
    //           focusTheme: FocusThemeData(
    //             glowFactor: is10footScreen(context) ? 2.0 : 0.0,
    //           ),
    //         ),
    //         locale: appTheme.locale,
    //         builder: (context, child) {
    //           return Directionality(
    //               textDirection: appTheme.textDirection,
    //               child: MainWrapperScreen());
    //         },
    //       );
    //     },
    //   ),
    // );
    return MultiBlocProvider(
      providers: [
        //    BlocProvider<UserBloc>(create: (context) => locator<UserBloc>()),
        BlocProvider<ThemeCubit>(create: (context) => locator<ThemeCubit>()),
        BlocProvider<DirectionalityCubit>(
            create: (context) => locator<DirectionalityCubit>()),
        BlocProvider<BottomNavigationBarCubit>(
            create: (context) => locator<BottomNavigationBarCubit>()),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => DirectionalityProvider()),
        ],
        child: Builder(
          builder: (context) {
            LanguageDetector.init(context);
            return ChangeNotifierProvider<DirectionalityProvider>(
              create: (_) => DirectionalityProvider(),
              child: Consumer<DirectionalityProvider>(
                  builder: (context, directionalityProvider, child) {
                ThemeDetector.init(context);
                return Directionality(
                    textDirection: directionalityProvider.direction,
                    child: BlocBuilder<ThemeCubit, ThemeState>(
                      builder: (themeContext, themeState) {
                        isDark = themeState.isDark;
                        return MaterialApp(
                          debugShowCheckedModeBanner: false,
                          theme: themeState.themeData,
                          home: Directionality(
                            textDirection: directionalityProvider.direction,
                            child: const MainWrapperScreen(),
                          ),
                        );
                      },
                    ));
              }),
            );
          },
        ),
      ),
    );
  }
}

timeStamp() {
  return DateTime.now().millisecondsSinceEpoch.toString();
}
