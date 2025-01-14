import 'package:flutter/material.dart';
import 'package:shop_app/core/theme.dart';
import 'package:shop_app/features/catalog_tab/filter.dart';
import 'package:shop_app/features/catalog_tab/presentation/provider/filter_provider.dart';

class CatalogFiltersPage extends StatelessWidget {
  CatalogFiltersPage({super.key, required this.filterProvider});

  ProductFilter filter = ProductFilter();
  final FilterProvider filterProvider;
  @override
  Widget build(BuildContext context) {
    final colorTheme = theme.colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: colorTheme.inversePrimary,
          child: Column(
            children: [
              AppBar(
                centerTitle: true,
                backgroundColor: Colors.transparent,
                title: const Text(
                  'Фильтры',
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    spacing: 24,
                    children: [
                      FiltersRowWidget(
                        button: FilterDropdownButton(
                          filter: filter,
                          items: sortBy,
                          type: "sortBy",
                        ),
                        title: 'Сортировка',
                      ),
                      FiltersRowWidget(
                        button: FilterDropdownButton(
                            filter: filter, items: skinType, type: "skinType"),
                        title: 'Тип кожи',
                      ),
                      FiltersRowWidget(
                        button: FilterDropdownButton(
                          filter: filter,
                          items: productType,
                          type: "productType",
                        ),
                        title: 'Тип средства',
                      ),
                      FiltersRowWidget(
                        button: FilterDropdownButton(
                            filter: filter,
                            items: skinProblem,
                            type: "skinProblem"),
                        title: 'Проблема кожи',
                      ),
                      FiltersRowWidget(
                        button: FilterDropdownButton(
                            filter: filter, items: effect, type: "effect"),
                        title: 'Эффект средства',
                      ),
                      FiltersRowWidget(
                        button: FilterDropdownButton(
                            filter: filter,
                            items: cosmeticsLine,
                            type: "cosmeticsLine"),
                        title: 'Линейка косметики',
                      ),
                      const Spacer(),
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9)),
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                            ),
                            onPressed: () {
                              filterProvider.updateFilter(filter);
                              Navigator.pop(context);
                              print(filter);
                            },
                            child: Text('Применить фильтры',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: Colors.white))),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FiltersRowWidget extends StatelessWidget {
  const FiltersRowWidget({
    super.key,
    required this.button,
    required this.title,
  });
  final String title;
  final FilterDropdownButton button;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w600,
          ),
        ),
        button
      ],
    );
  }
}

class FilterDropdownButton extends StatefulWidget {
  final List<String> items;
  final ProductFilter filter;
  final String type;
  const FilterDropdownButton(
      {super.key,
      required this.items,
      required this.filter,
      required this.type});

  @override
  State<FilterDropdownButton> createState() => _FilterDropdownButtonState();
}

class _FilterDropdownButtonState extends State<FilterDropdownButton> {
  late String value;

  @override
  void initState() {
    value = widget.items[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        underline: const SizedBox.shrink(),
        alignment: AlignmentDirectional.centerEnd,
        value: value,
        icon: const SizedBox.shrink(),
        items: widget.items.map((String e) {
          return DropdownMenuItem<String>(
              value: e,
              child: Text(
                e,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontWeight: FontWeight.w400,
                    ),
              ));
        }).toList(),
        onChanged: (value) {
          switch (widget.type) {
            case 'sortBy':
            case 'skinType':
              value != "Не выбрано" ? widget.filter.skinType = value : null;
              break;
            case 'productType':
              value != "Не выбрано" ? widget.filter.productType = value : null;
              break;
            case 'skinProblem':
              value != "Не выбрано" ? widget.filter.skinProblem = value : null;
              break;
            case 'effect':
              value != "Не выбрано" ? widget.filter.effect = value : null;
              break;
            case 'cosmeticsLine':
              value != "Не выбрано"
                  ? widget.filter.cosmeticsLine = value
                  : null;
              break;
          }
          setState(() {
            this.value = value!;
          });
        });
  }
}

List<String> skinType = [
  "Не выбрано",
  'Жирная',
  'Комбинированная',
  'Сухая',
  'Нормальная',
  'Любая',
];
List<String> productType = [
  "Не выбрано",
  'Маска',
  'Крем',
  'Сыворотка',
  'Молочко',
  'Тонер',
];

List<String> skinProblem = [
  "Не выбрано",
  "Обезвоженность",
  "Тусклость",
  "Чувствительность",
  "Акне",
  "Морщины",
  "Покраснения",
  "Сухость",
];

List<String> cosmeticsLine = [
  "Не выбрано",
  "Christina",
  "Christina Illustrious",
  "Christina Muse",
  "Christina Supreme",
  "Christina Young",
  "Christina Unstress",
];

List<String> effect = [
  "Не выбрано",
  "Успокаивающий",
  "Осветляющий",
  "Питание",
  "Защита",
  "Увлажнение",
  "Восстановление",
  "Антивозрастной",
  "Успокоение",
  "Гидратация",
];

List<String> sortBy = ["Не выбрано", "По популярности"];
