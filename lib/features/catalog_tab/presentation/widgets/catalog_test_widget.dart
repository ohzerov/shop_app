import 'package:flutter/material.dart';
import 'package:shop_app/core/utils/size_config.dart';

class CatalogTestWidget extends StatelessWidget {
  const CatalogTestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.height(170),
      child: Stack(
        fit: StackFit.loose,
        alignment: Alignment.centerLeft,
        children: [
          SizedBox(
            width: double.infinity,
            child: Transform.flip(
              flipX: true,
              child: Opacity(
                opacity: 0.42,
                child: Image.asset(
                  'assets/image_test.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(radius: 0.5, colors: [
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(40, 255, 255, 255)
                ]),
              ),
              height: SizeConfig.height(170),
              width: SizeConfig.width(170),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: SizeConfig.height(10), horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Составим схему идеального \nдомашнего ухода',
                  style: TextStyle(
                      fontSize: SizeConfig.textSize(16),
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  '10 вопросов о вашей коже',
                  style: TextStyle(
                      fontSize: SizeConfig.textSize(14),
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: SizeConfig.height(40),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        backgroundColor: Theme.of(context).colorScheme.primary),
                    onPressed: () {},
                    child: Text(
                      'Пройти тест',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.white,
                          fontSize: SizeConfig.textSize(12)),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
