import 'package:flutter/material.dart';
import 'package:shop_app/features/catalog_tab/filter.dart';

class FilterProvider extends InheritedWidget {
  final ProductFilter filter;
  final void Function(ProductFilter newFilter) updateFilter;
  const FilterProvider({
    required this.filter,
    required this.updateFilter,
    required Widget child,
  }) : super(child: child);

  static FilterProvider of(BuildContext context) {
    final FilterProvider? result =
        context.dependOnInheritedWidgetOfExactType<FilterProvider>();
    assert(result != null, 'No FilterProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(FilterProvider oldWidget) {
    return filter != oldWidget.filter;
  }
}
