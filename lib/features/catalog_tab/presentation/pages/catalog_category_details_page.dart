import 'package:flutter/material.dart';
import 'package:shop_app/features/catalog_tab/filter.dart';
import 'package:shop_app/features/catalog_tab/presentation/provider/filter_provider.dart';

class CatalogCategoryDetailsPage extends StatelessWidget {
  const CatalogCategoryDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final filterProvider = FilterProvider.of(context);
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppBar(
            centerTitle: true,
            title: const Text('По типу кожи'),
          ),
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              spacing: 32,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogButtonDetails(
                    function: () {
                      filterProvider
                          .updateFilter(ProductFilter(skinType: 'Жирная'));
                      Navigator.of(context).pushNamed('/catalog_products');
                    },
                    buttonText: 'Жирная'),
                CatalogButtonDetails(
                    function: () {
                      filterProvider.updateFilter(ProductFilter(
                        skinType: 'Комбинированная',
                      ));
                      Navigator.of(context).pushNamed('/catalog_products');
                    },
                    buttonText: 'Комбинированная'),
                CatalogButtonDetails(
                    function: () {
                      filterProvider.updateFilter(ProductFilter(
                        skinType: 'Сухая',
                      ));
                      Navigator.of(context).pushNamed('/catalog_products');
                    },
                    buttonText: 'Сухая'),
                CatalogButtonDetails(
                    function: () {
                      filterProvider.updateFilter(ProductFilter(
                        skinType: 'Нормальная',
                      ));
                      Navigator.of(context).pushNamed('/catalog_products');
                    },
                    buttonText: 'Нормальная'),
                CatalogButtonDetails(
                    function: () {
                      filterProvider.updateFilter(ProductFilter(
                        skinType: 'Любая',
                      ));
                      Navigator.of(context).pushNamed('/catalog_products');
                    },
                    buttonText: 'Любой тип'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CatalogButtonDetails extends StatelessWidget {
  CatalogButtonDetails(
      {super.key, required this.function, required this.buttonText});

  VoidCallback function;
  String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: SizedBox(
        child: Text(
          buttonText,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}
