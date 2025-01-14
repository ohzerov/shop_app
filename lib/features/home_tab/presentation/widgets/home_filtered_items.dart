// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shop_app/core/data/models/product_model.dart';
import 'package:shop_app/core/data/products_list.dart';

class HomeFilteredItems extends StatelessWidget {
  HomeFilteredItems({
    Key? key,
    this.isDiscount = false,
    required this.titleBig,
    required this.gradient,
    required this.filterBy,
  }) : super(key: key);
  final String titleBig;
  final LinearGradient gradient;
  final String filterBy;
  bool isDiscount;

  List<ProductModel> filteredList = [];
  @override
  Widget build(BuildContext context) {
    !isDiscount
        ? filteredList = products.where((e) => e.skinType == filterBy).toList()
        : filteredList =
            products.where((e) => e.isDiscount == isDiscount).toList();
    return Column(
      spacing: 24,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: TitleWidget(
            titleText: titleBig,
            gradient: gradient,
            filterBy: filterBy,
          ),
        ),
        SizedBox(
          height: 278,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: index == 0 ? 16 : 0,
                      right: index == filteredList.length - 1 ? 16 : 12),
                  child: ProductCartWidget(
                      isDiscount: filteredList[index].isDiscount,
                      isDouble: filteredList[index].isDouble,
                      imgUrl: filteredList[index].imgUrl,
                      title: filteredList[index].name,
                      type: filteredList[index].productType,
                      price: filteredList[index].price.round().toString()),
                );
              }),
        )
      ],
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget(
      {super.key,
      required this.titleText,
      required this.gradient,
      required this.filterBy});
  final String titleText;
  final LinearGradient gradient;
  final filterBy;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        Container(
          width: 118,
          height: 4,
          decoration: BoxDecoration(gradient: gradient),
        )
      ],
    );
  }
}

class ProductCartWidget extends StatelessWidget {
  const ProductCartWidget(
      {super.key,
      required this.isDiscount,
      required this.isDouble,
      required this.imgUrl,
      required this.title,
      required this.price,
      required this.type});
  final String title;
  final String price;
  final String type;
  final String imgUrl;
  final bool isDiscount;
  final bool isDouble;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).colorScheme.surface),
              height: 188,
              width: 162,
              child: Align(
                child: Image.asset(
                  width: 120,
                  imgUrl,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text(
              type,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            Text(
              "$price ₽",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        Positioned(
          top: 8,
          right: 8,
          child: SizedBox(
            height: 60,
            child: Column(
              spacing: 8,
              children: [
                isDiscount
                    ? SizedBox(
                        width: 25,
                        child: Image.asset(
                          'assets/icons/icon_discount_black.png',
                        ),
                      )
                    : SizedBox.shrink(),
                isDouble
                    ? SizedBox(
                        width: 25,
                        child: Image.asset(
                          'assets/icons/icon_double.png',
                        ),
                      )
                    : SizedBox.shrink()
              ],
            ),
          ),
        )
      ],
    );
  }
}
