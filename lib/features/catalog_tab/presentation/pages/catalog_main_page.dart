import 'package:flutter/material.dart';
import 'package:shop_app/core/utils/size_config.dart';
import 'package:shop_app/features/catalog_tab/presentation/widgets/catalog_search_widget.dart';
import 'package:shop_app/features/catalog_tab/presentation/widgets/catalog_test_widget.dart';

class CatalogMainPage extends StatelessWidget {
  void goToDetails(BuildContext context) {
    Navigator.of(context).pushNamed('/catalog_details');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CatalogSearchWidget(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 39),
            child: Column(
              spacing: SizeConfig.height(16),
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CatalogMainPageButton(
                    onPressed: () => goToDetails(context), text: 'Назначение'),
                CatalogMainPageButton(
                    onPressed: () => goToDetails(context),
                    text: 'Тип средства'),
                CatalogMainPageButton(
                    onPressed: () => goToDetails(context), text: 'Тип кожи'),
                CatalogMainPageButton(
                    onPressed: () => goToDetails(context),
                    text: 'Линия косметики'),
                CatalogMainPageButton(
                    onPressed: () => goToDetails(context), text: 'Наборы'),
                CatalogMainPageButton(
                    onPressed: () => goToDetails(context), text: 'Акции'),
                CatalogMainPageButton(
                    onPressed: () => goToDetails(context),
                    text: 'Консультация с\nКосметологом'),
              ],
            ),
          ),
        ),
        CatalogTestWidget()
      ],
    );
  }
}

class CatalogMainPageButton extends StatelessWidget {
  const CatalogMainPageButton(
      {super.key, required this.onPressed, required this.text});
  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Row(
          spacing: 4,
          children: [
            Text(
              text,
              style: TextStyle(
                  fontSize: SizeConfig.textSize(20),
                  fontWeight: FontWeight.w600),
            ),
            text == 'Акции'
                ? SizedBox(
                    width: 25,
                    child: Image.asset('assets/icons/icon_discount.png'))
                : SizedBox.shrink()
          ],
        ));
  }
}
