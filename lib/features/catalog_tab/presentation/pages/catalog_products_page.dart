import 'package:flutter/material.dart';
import 'package:shop_app/core/data/models/product_model.dart';
import 'package:shop_app/core/data/products_list.dart';
import 'package:shop_app/core/theme.dart';
import 'package:shop_app/features/catalog_tab/filter.dart';
import 'package:shop_app/features/catalog_tab/presentation/provider/filter_provider.dart';

class CatalogProductsPage extends StatefulWidget {
  CatalogProductsPage({super.key, required this.openFilers});
  VoidCallback openFilers;

  @override
  State<CatalogProductsPage> createState() => _CatalogProductsPageState();
}

class _CatalogProductsPageState extends State<CatalogProductsPage> {
  int? activeIndex;
  String title = 'любой кожи';
  List<String> filterButtons = [
    'Увлажнение',
    'Очищение',
    'Регенерация',
    'Насыщение'
  ];
  @override
  Widget build(BuildContext context) {
    final textTheme = theme.textTheme;
    final colorTheme = theme.colorScheme;
    final filterProvider = FilterProvider.of(context);
    switch (filterProvider.filter.skinType) {
      case 'Жирная':
        title = 'Средства \nдля жирной кожи';
        break;
      case 'Комбинированная':
        title = 'Средства \nдля комбинированной кожи';
      case 'Сухая':
        title = 'Средства \nдля сухой кожи';
        break;
      case 'Нормальная':
        title = 'Средства \nдля нормальной кожи';
        break;
      case 'Любая':
        title = 'Средства \nдля любой кожи';
        break;
      default:
        title = 'Все типы кожи';
    }
    List<ProductModel> filteredList;

    filteredList = products.where((product) {
      if (filterProvider.filter.skinType != null &&
          product.skinType != filterProvider.filter.skinType) {
        return false;
      }
      if (filterProvider.filter.productType != null &&
          product.productType != filterProvider.filter.productType) {
        return false;
      }
      if (filterProvider.filter.skinProblem != null &&
          product.skinProblem != filterProvider.filter.skinProblem) {
        return false;
      }
      if (filterProvider.filter.effect != null &&
          product.effect != filterProvider.filter.effect) {
        return false;
      }

      if (filterProvider.filter.cosmeticsLine != null &&
          product.cosmeticsLine != filterProvider.filter.cosmeticsLine) {
        return false;
      }
      return true;
    }).toList();

    return Container(
      height: MediaQuery.sizeOf(context).height,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            surfaceTintColor: Colors.transparent,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "$title",
                    style: textTheme.titleLarge,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '${filteredList.length} продуктов',
                      style: textTheme.titleSmall,
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: widget.openFilers,
                      icon: Icon(Icons.tune),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 44,
                child: ListView.builder(
                  itemCount: filterButtons.length,
                  itemBuilder: (context, index) {
                    double paddingLeft = index == 0 ? 16 : 0;
                    double paddingRight =
                        index == filterButtons.length - 1 ? 16 : 12;
                    return Padding(
                        padding: EdgeInsets.only(
                            left: paddingLeft, right: paddingRight),
                        child: CatalogProductsFilterButton(
                            btnText: filterButtons[index],
                            isActive: activeIndex == index,
                            onTap: () {
                              activeIndex = index;
                              setState(() {});
                              FilterProvider.of(context).updateFilter(
                                  ProductFilter(effect: filterButtons[index]));
                            }));
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const SizedBox(
                height: 12,
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: filteredList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: MediaQuery.sizeOf(context).height / 200,
                  mainAxisExtent: MediaQuery.sizeOf(context).height / 2.7,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      spacing: 4,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: MediaQuery.sizeOf(context).height / 4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context).colorScheme.surface),
                          child: Align(
                            child: SizedBox(
                              width: 120,
                              child: Image.asset(
                                filteredList[index].imgUrl,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          filteredList[index].productType,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          filteredList[index].name,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "${filteredList[index].price.round().toString()} ₽",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CatalogProductsFilterButton extends StatelessWidget {
  CatalogProductsFilterButton(
      {super.key,
      required this.btnText,
      required this.isActive,
      required this.onTap});
  final String btnText;
  VoidCallback onTap;

  bool isActive;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        decoration: BoxDecoration(
            color: isActive ? Color(0xFF171717) : Color(0xFFF4F4F4),
            borderRadius: BorderRadius.circular(11)),
        child: Center(
          child: Text(
            btnText,
            style: TextStyle(color: isActive ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
