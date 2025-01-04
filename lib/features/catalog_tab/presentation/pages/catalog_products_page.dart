import 'package:flutter/material.dart';
import 'package:shop_app/core/data/models/product_model.dart';
import 'package:shop_app/core/data/products_list.dart';
import 'package:shop_app/core/theme.dart';
import 'package:shop_app/features/catalog_tab/presentation/filter_provider.dart';
import 'package:shop_app/features/catalog_tab/presentation/pages/catalog_filters_page.dart';

class CatalogProductsPage extends StatelessWidget {
  CatalogProductsPage({super.key, required this.openFilers});
  VoidCallback openFilers;
  String title = 'любой кожи';
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
                      onPressed: openFilers,
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
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 16,
                    ),
                    Container(
                      width: 120,
                      decoration: BoxDecoration(
                          color: colorTheme.surface,
                          borderRadius: BorderRadius.circular(11)),
                      child: Center(
                          child: Text(
                        'Очищение',
                        style: textTheme.bodyMedium,
                      )),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      width: 120,
                      decoration: BoxDecoration(
                          color: Color(0xFF171717),
                          borderRadius: BorderRadius.circular(11)),
                      child: Center(
                          child: Text(
                        'Увлажнение',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      width: 120,
                      decoration: BoxDecoration(
                          color: Color(0xFFF4F4F4),
                          borderRadius: BorderRadius.circular(11)),
                      child: const Center(child: Text('Регенерация')),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      width: 120,
                      decoration: BoxDecoration(
                          color: Color(0xFFF4F4F4),
                          borderRadius: BorderRadius.circular(11)),
                      child: Center(child: Text('Насыщение')),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                  ],
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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 14, vertical: 18),
                        width: double.infinity,
                        height: 190,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xFFF4F4F4),
                        ),
                        child: Image.asset(
                          filteredList[index].imgUrl,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Column(
                        spacing: 6,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: double.infinity,
                          ),
                          Text(
                            filteredList[index].productType,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            filteredList[index].name,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "${filteredList[index].price.round().toString()} ₽",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
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
