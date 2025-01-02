import 'package:flutter/material.dart';
import 'package:shop_app/features/catalog_tab/filter.dart';
import 'package:shop_app/features/catalog_tab/presentation/filter_provider.dart';

class FilterProviderWidget extends StatefulWidget {
  final Widget child;
  const FilterProviderWidget({super.key, required this.child});

  @override
  State<FilterProviderWidget> createState() => _FilterProviderWidgetState();
}

class _FilterProviderWidgetState extends State<FilterProviderWidget> {
  ProductFilter _currentFilter = ProductFilter();

  void _updateFilter(ProductFilter newFilter) {
    setState(() {
      _currentFilter = newFilter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FilterProvider(
      filter: _currentFilter,
      updateFilter: _updateFilter,
      child: widget.child,
    );
  }
}
