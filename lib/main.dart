import 'package:flutter/material.dart';
import 'package:pet/service/hive_service.dart';
import 'package:pet/view_models/auth_model.dart';
import 'package:pet/utils/navigation.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'view_models/notification_model.dart';
import 'view_models/settings_model.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService().init();
  await Supabase.initialize(
    url: 'https://xyzcompany.supabase.co',
    anonKey: 'public-anon-key',
  );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthModel>(
          create: (context) => AuthModel(),
        ),
        ChangeNotifierProvider<SettingsModel>(
          create: (context) => SettingsModel(),
        ),
        ChangeNotifierProvider<NotificationModel>(
          create: (context) => NotificationModel(),
        ),
      ],
      child: Consumer<SettingsModel>(
        builder: (context, themeModel, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: themeModel.theme,
            routerConfig: NavigatorApp().routerConfig,
          );
        },
      ),
    );
  }
}