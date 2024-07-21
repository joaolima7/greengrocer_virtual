import 'package:go_router/go_router.dart';
import 'package:greengrocer_virtual/src/layers/presentation/ui/pages/auth/login_page.dart';
import 'package:greengrocer_virtual/src/layers/presentation/ui/pages/auth/signup_page.dart';
import 'package:greengrocer_virtual/src/layers/presentation/ui/pages/base/base_screen.dart';

final routes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => SignUpPage(),
    ),
    GoRoute(
      path: '/base',
      builder: (context, state) => BaseScreen(),
    ),
  ],
);
