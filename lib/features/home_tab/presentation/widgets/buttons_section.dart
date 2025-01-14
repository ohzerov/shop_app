import 'package:flutter/material.dart';

class ButtonsSection extends StatelessWidget {
  const ButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 7,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            spacing: 7,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonsSectionButton(
                btnText: 'Для очищения',
              ),
              ButtonsSectionButton(
                btnText: 'Для увлажнения',
              )
            ],
          ),
          Row(
            spacing: 7,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonsSectionButton(
                btnText: 'Для питания',
              ),
              ButtonsSectionButton(
                btnText: 'Для омоложения',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ButtonsSectionButton extends StatelessWidget {
  const ButtonsSectionButton({super.key, required this.btnText});
  final String btnText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              border: Border.all(
                  width: 1, color: const Color.fromARGB(10, 0, 0, 0))),
          child: Center(
            child: Text(
              btnText,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }
}
