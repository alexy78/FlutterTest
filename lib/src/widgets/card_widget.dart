import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:test_app/src/constants/fonts.dart';
import 'package:test_app/src/providers/app_provider.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 20, 22, 20),
      child: Container(
        padding: const EdgeInsets.only(left: 25),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(30, 30, 30, 1),
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
        child: Stack(
          children: [
            Image.asset('assets/car.png'),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Привіт,',
                    style: Fonts.textStyle3,
                  ),
                  Text(
                    context.read<AppProvider>().userName,
                    style: Fonts.textStyle6,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Додавання авто',
                    style: Fonts.textStyle7,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Завантажте дані про ваше авто для',
                    style: Fonts.textStyle2,
                  ),
                  Text(
                    'кращого використання сервісу.',
                    style: Fonts.textStyle2,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        'Додати авто',
                        style: Fonts.textStyle2.copyWith(color: Colors.green),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_right_outlined,
                        size: 10,
                        color: Colors.green,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 52,
              right: 96,
              child: SvgPicture.asset(
                'assets/rotated-question.svg',
              ),
            ),
            Positioned(
              top: 11,
              right: 57,
              child: SvgPicture.asset(
                'assets/rotated-car.svg',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
