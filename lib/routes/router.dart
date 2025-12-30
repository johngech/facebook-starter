import 'package:facebook/app_screens.dart';
import 'package:go_router/go_router.dart';

GoRouter appRoute() => GoRouter(
  initialLocation: "/",
  routes: <RouteBase>[
    GoRoute(path: "/", builder: (context, state) => const SplashScreen()),
    GoRoute(path: "/home", builder: (context, state) => const HomeScreen()),
    GoRoute(path: "/search", builder: (context, state) => const SearchScreen()),
    GoRoute(path: "/login", builder: (context, state) => const LoginScreen()),
    GoRoute(
      path: "/profile",
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: "/friends",
      builder: (context, state) => const FriendsScreen(),
    ),
  ],
);
