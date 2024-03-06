import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test_app/src/constants/fonts.dart';
import 'package:test_app/src/constants/routes.dart';
import 'package:test_app/src/providers/app_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _textEditingController;
  late AppProvider appProvider;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    appProvider = context.read<AppProvider>();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        toolbarHeight: 0,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(30, 30, 30, 1),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color.fromRGBO(30, 30, 30, 1),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 130, left: 20, right: 20, bottom: 20),
        child: Column(
          children: [
            Text(
              'Як до вас звертатися?',
              style: Fonts.textStyle1,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Будь ласка, укажіть ваше імʼя для персоналізації сервісу.',
                style: Fonts.textStyle2,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              style: Fonts.textStyle4,
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: "Ваше ім'я",
                hintStyle: Fonts.textStyle4.copyWith(
                  color: const Color.fromRGBO(255, 255, 255, 0.6),
                ),
              ),
              onTapOutside: (_) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  appProvider.userName = _textEditingController.text;
                  await appProvider.checkConnectivity();
                  await appProvider.checkLocationPermission().then((value) =>
                      Navigator.pushNamed(context, Routes.homeScreen.name));
                },
                child: Text(
                  'Продовжити',
                  style: Fonts.textStyle3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
