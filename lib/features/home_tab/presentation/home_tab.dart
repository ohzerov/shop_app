import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/features/home_tab/presentation/widgets/buttons_section.dart';
import 'package:shop_app/features/home_tab/presentation/widgets/carousel_widget.dart';
import 'package:shop_app/features/home_tab/presentation/widgets/categories_row.dart';
import 'package:shop_app/features/home_tab/presentation/widgets/home_filtered_items.dart';
import 'package:shop_app/features/home_tab/presentation/widgets/home_test_widget.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        CarouselWidget(),
        SizedBox(
          height: 25,
        ),
        CategoriesRow(),
        SizedBox(
          height: 32,
        ),
        HomeFilteredItems(
          gradient:
              LinearGradient(colors: [Color(0xFFE4FEF9), Color(0xFF66F6DC)]),
          titleBig: 'Новинки',
          filterBy: 'Сухая',
        ),
        SizedBox(
          height: 24,
        ),
        HomeTestWidget(),
        SizedBox(
          height: 24,
        ),
        HomeFilteredItems(
          isDiscount: true,
          gradient:
              LinearGradient(colors: [Color(0xFFFFC0E1), Color(0xFFF02980)]),
          titleBig: 'Акции',
          filterBy: 'Любая',
        ),
        SizedBox(
          height: 24,
        ),
        ButtonsSection(),
        SizedBox(
          height: 24,
        ),
        HomeFilteredItems(
          gradient:
              LinearGradient(colors: [Color(0xFFFCBC5C), Color(0xFFF86614)]),
          titleBig: 'Хиты',
          filterBy: 'Комбинированная',
        ),
        SizedBox(
          height: 51,
        ),
      ],
    );
  }
}
