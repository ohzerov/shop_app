import 'package:flutter/material.dart';

class CatalogMainPage extends StatelessWidget {
  const CatalogMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const TextField(
              decoration: InputDecoration(
                  prefix: Icon(Icons.search_outlined), hintText: 'Поиск'),
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 2.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CatalogButton(function: () {}, buttonText: 'Назначение'),
                  CatalogButton(function: () {}, buttonText: 'Тип средства'),
                  CatalogButton(
                      function: () {
                        Navigator.of(context).pushNamed('/catalog_details');
                      },
                      buttonText: 'Тип кожи'),
                  CatalogButton(function: () {}, buttonText: 'Линия косметики'),
                  CatalogButton(function: () {}, buttonText: 'Наборы'),
                  CatalogButton(function: () {}, buttonText: 'Акции'),
                  CatalogButton(
                      function: () {},
                      buttonText: 'Консультация с кометологом'),
                ],
              ),
            ),
            Spacer(),
            Container(
              color: Colors.red,
              width: double.infinity,
              height: 200,
            )
          ],
        ),
      ),
    );
  }
}

class CatalogButton extends StatelessWidget {
  CatalogButton({super.key, required this.function, required this.buttonText});

  VoidCallback function;
  String buttonText;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: function,
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ));
  }
}
