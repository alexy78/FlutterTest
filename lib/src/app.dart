import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/src/constants/fonts.dart';
import 'package:test_app/src/providers/app_provider.dart';
import 'package:test_app/src/screens/home_screen.dart';
import 'package:test_app/src/screens/login_screen.dart';
import 'package:test_app/src/constants/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(30, 30, 30, 1),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 16)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromRGBO(12, 186, 112, 1)),
            ),
          ),
          navigationBarTheme: NavigationBarThemeData(
            backgroundColor: const Color.fromRGBO(30, 30, 30, 1),
            indicatorColor: Colors.transparent,
            labelTextStyle: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.selected)) {
                  return Fonts.textStyle5;
                }
                return Fonts.textStyle5.copyWith(color: Colors.grey);
              },
            ),
            iconTheme: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.selected)) {
                  return const IconThemeData(color: Colors.white);
                }
                return const IconThemeData(color: Colors.grey);
              },
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: const Color.fromRGBO(41, 41, 41, 1),
            labelStyle: const TextStyle(color: Colors.blue),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                width: 1,
                color: Color.fromRGBO(12, 186, 112, 1),
              ),
            ),
          ),
        ),
        initialRoute: Routes.loginScreen.name,
        routes: {
          Routes.loginScreen.name: (context) => const LoginScreen(),
          Routes.homeScreen.name: (context) => const HomeScreen(),
        },
      ),
    );
  }
}
