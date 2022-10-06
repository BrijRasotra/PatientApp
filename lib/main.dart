import 'package:flutter/material.dart';
import 'package:patient_app/Screens/DrawerPage/provider/drawerProvider.dart';
import 'package:patient_app/Screens/login/login_provider.dart';
import 'package:patient_app/Screens/splashScreen/splash_screen.dart';
import 'package:provider/provider.dart';

import 'Screens/MyProfile/provider/profileProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => DrawerProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
