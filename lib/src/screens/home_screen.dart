import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app/src/widgets/header_widget.dart';
import 'package:test_app/src/widgets/map_widget.dart';
import 'package:test_app/src/widgets/navigation_bar_widget.dart';
import '../constants/fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(12, 186, 112, 1),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color.fromRGBO(12, 186, 112, 1),
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        elevation: 0,
        title: const Text('logo'),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 22),
            child: Icon(Icons.phone),
          )
        ],
      ),
      body: Column(
        children: [
          const HeaderWidget(),
          const SizedBox(height: 25),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const MapWidget(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Викликати майстра',
                          style: Fonts.textStyle3,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }
}
