// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shop_app/core/utils/size_config.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 97,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 12),
        scrollDirection: Axis.horizontal,
        itemCount: categoriesRowItems.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(
              left: index == 0 ? 16 : 0,
              right: index == categoriesRowItems.length - 1 ? 16 : 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 72,
                height: 72,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    categoriesRowItems[index].imgUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
              ),
              Text(
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                categoriesRowItems[index].title,
              )
            ],
          ),
        ),
      ),
    );
  }
}

const List categoriesRowItems = [
  CategoriesRowItem(title: 'Наборы', imgUrl: 'assets/image1.png'),
  CategoriesRowItem(title: 'Для лица', imgUrl: 'assets/image2.png'),
  CategoriesRowItem(title: 'Для глаз', imgUrl: 'assets/image3.png'),
  CategoriesRowItem(title: 'Для тела', imgUrl: 'assets/image4.png'),
  CategoriesRowItem(title: 'Умывание', imgUrl: 'assets/image5.png'),
];

class CategoriesRowItem {
  final String title;
  final String imgUrl;
  const CategoriesRowItem({
    required this.title,
    required this.imgUrl,
  });
}
