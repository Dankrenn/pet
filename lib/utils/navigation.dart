import 'package:go_router/go_router.dart';
import 'package:pet/view/auth_view.dart';
import 'package:pet/view/hub_view.dart';
import 'package:pet/view/notification_view.dart';
import 'package:pet/view/profile/add_pet_view.dart';
import 'package:pet/view/profile/profile_view.dart';
import 'package:pet/view/profile/setting_view.dart';
import 'package:pet/view/registr_view.dart';

abstract class NavigatorRouse {
  static const String auth = "/auth";
  static const String register = "/auth/register";
  static const String updatePassword = "/auth/updatePassword";
  static const String hub = "/hub";
  static const String profile = "/hub/profile";
  static const String settings = "/hub/profile/settings";
  static const String notification = "/hub";
  static const String addPet = "/hub/profile/addPet";
}

class NavigatorApp {
  static final GoRouter _router = GoRouter(
    initialLocation: NavigatorRouse.auth,
    routes: [
      GoRoute(path: NavigatorRouse.auth, builder: (context, state) => AuthView()),
      GoRoute(path: NavigatorRouse.register, builder: (context, state) => RegistrView()),
      GoRoute(path: NavigatorRouse.updatePassword, builder: (context, state) => AuthView()),
      GoRoute(path: NavigatorRouse.hub, builder: (context, state) => HubView()),
      GoRoute(path: NavigatorRouse.profile, builder: (context, state) => ProfileView()),
      GoRoute(path: NavigatorRouse.settings, builder: (context, state) => SettingsView()),
      GoRoute(path: NavigatorRouse.notification, builder: (context, state) => NotificationView()),
      GoRoute(path: NavigatorRouse.addPet, builder: (context, state) => AddPetView()),
      // GoRoute(path: NavigatorRouse.instructions, builder: (context, state) => InstructionsView()),
      // GoRoute(path: NavigatorRouse.groupList, builder: (context, state) => GroupListView()),
      // GoRoute(path: NavigatorRouse.disciplines, builder: (context, state) => DisciplinesView()),
      // GoRoute(path: NavigatorRouse.settings, builder: (context, state) => SettingsView()),
      // GoRoute(path: NavigatorRouse.magazine, builder: (context, state) => MagazineView()),
      // GoRoute(path: NavigatorRouse.qrGeneration, builder: (context, state) => QrGenerationView()),
    ],
  );
  GoRouter get routerConfig => _router;
}