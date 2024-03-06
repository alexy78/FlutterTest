import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:test_app/src/constants/fonts.dart';
import 'package:test_app/src/providers/app_provider.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isAccessesEnabled =
        context.read<AppProvider>().geolocationEnabled &&
            context.read<AppProvider>().connectivityEnabled;

    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 0, 22, 20),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (isAccessesEnabled) ...[
            Image.asset(
              'assets/map-with-dot.png',
            ),
          ] else ...[
            Image.asset(
              'assets/map.png',
              color: Colors.white.withOpacity(0.2),
              colorBlendMode: BlendMode.modulate,
            ),
          ],
          if (!isAccessesEnabled) ...[
            Column(
              children: [
                SvgPicture.asset(
                  'assets/wifi.svg',
                ),
                const SizedBox(height: 20),
                Text(
                  'Відсутній звʼязок',
                  style: Fonts.textStyle1,
                ),
                const SizedBox(height: 20),
                Text(
                  'Відсутність доступу до геолокації.',
                  style: Fonts.textStyle2,
                ),
                Text(
                  'Переконайтесь, що у додатку увімкено',
                  style: Fonts.textStyle2,
                ),
                Text(
                  "геолокацію та перевірте з'єднання з Інтернетом.",
                  style: Fonts.textStyle2,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Налаштування геолокації',
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
          ],
        ],
      ),
    );
  }
}
