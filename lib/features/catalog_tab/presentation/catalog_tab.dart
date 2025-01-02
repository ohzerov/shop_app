import 'package:flutter/material.dart';
import 'package:shop_app/features/catalog_tab/presentation/filter_provider_widget.dart';
import 'package:shop_app/features/catalog_tab/presentation/pages/catalog_category_details_page.dart';
import 'package:shop_app/features/catalog_tab/presentation/pages/catalog_main_page.dart';
import 'package:shop_app/features/catalog_tab/presentation/pages/catalog_products_page.dart';

class CatalogTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FilterProviderWidget(
      child: Navigator(
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              switch (settings.name) {
                case '/':
                  return CatalogMainPage();
                case '/catalog_details':
                  return CatalogCategoryDetailsPage();
                case '/catalog_products':
                  return CatalogProductsPage();
                default:
                  return CatalogMainPage();
              }
            },
          );
        },
      ),
    );
  }
}
