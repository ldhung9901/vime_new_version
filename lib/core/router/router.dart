import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:new_vime/feature/home/presentation/screen/main_wrapper_screen.dart';
import 'package:new_vime/feature/login/presentation/screen/login_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
final router = GoRouter(routes: <RouteBase>[
  GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
  GoRoute(path: '/', builder: (context, state) => const MainWrapperScreen())
]);
