import 'package:flutter/material.dart';
import 'package:shop_app/features/catalog_tab/presentation/provider/filter_provider.dart';
import 'package:shop_app/features/catalog_tab/presentation/provider/filter_provider_widget.dart';
import 'package:shop_app/features/catalog_tab/presentation/pages/catalog_category_details_page.dart';
import 'package:shop_app/features/catalog_tab/presentation/pages/catalog_filters_page.dart';
import 'package:shop_app/features/catalog_tab/presentation/pages/catalog_main_page.dart';
import 'package:shop_app/features/catalog_tab/presentation/pages/catalog_products_page.dart';

class CatalogTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void openFilters(FilterProvider filterProdiver) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CatalogFiltersPage(
                filterProvider: filterProdiver,
              )));
    }

    return FilterProviderWidget(
      child: Navigator(
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              final filterProvider = FilterProvider.of(context);
              switch (settings.name) {
                case '/':
                  return CatalogMainPage();
                case '/catalog_details':
                  return const CatalogCategoryDetailsPage();
                case '/catalog_products':
                  return CatalogProductsPage(openFilers: () {
                    openFilters(filterProvider);
                  });
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
