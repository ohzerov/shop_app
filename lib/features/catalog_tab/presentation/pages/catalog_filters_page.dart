import 'package:flutter/material.dart';
import 'package:shop_app/core/theme.dart';

class CatalogFiltersPage extends StatelessWidget {
  const CatalogFiltersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = theme.textTheme;
    final colorTheme = theme.colorScheme;
    return Container(
      color: colorTheme.inversePrimary,
      child: Column(
        children: [
          AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Text(
              'Фильтры',
              style: textTheme.labelLarge,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              spacing: 24,
              children: [
                FiltersRowWidget(
                  button: FilterDropdownButton(items: sortBy),
                  title: 'Сортировка',
                ),
                FiltersRowWidget(
                  button: FilterDropdownButton(items: skinType),
                  title: 'Тип кожи',
                ),
                FiltersRowWidget(
                  button: FilterDropdownButton(items: productType),
                  title: 'Тип средства',
                ),
                FiltersRowWidget(
                  button: FilterDropdownButton(items: skinProblem),
                  title: 'Проблема кожи',
                ),
                FiltersRowWidget(
                  button: FilterDropdownButton(items: effect),
                  title: 'Эффект средства',
                ),
                FiltersRowWidget(
                  button: FilterDropdownButton(items: cosmeticsLine),
                  title: 'Линейка косметики',
                ),
                ElevatedButton(onPressed: null, child: Text('Apply Filters'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FiltersRowWidget extends StatelessWidget {
  const FiltersRowWidget(
      {super.key, required this.button, required this.title});
  final String title;
  final FilterDropdownButton button;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.bodyLarge!),
        button
      ],
    );
  }
}

class FilterDropdownButton extends StatefulWidget {
  final List<String> items;

  const FilterDropdownButton({super.key, required this.items});

  @override
  State<FilterDropdownButton> createState() => _FilterDropdownButtonState();
}

class _FilterDropdownButtonState extends State<FilterDropdownButton> {
  String? value;
  @override
  Widget build(BuildContext context) {
    final textTheme = theme.textTheme;
    final colorTheme = theme.colorScheme;
    return SizedBox(
      width: 175,
      child: DropdownButton<String>(
          value: value,
          icon: const SizedBox.shrink(),
          items: widget.items.map((String e) {
            return DropdownMenuItem<String>(
                value: e,
                child: Text(
                  e,
                  style: textTheme.bodyLarge!.copyWith(
                    color: colorTheme.tertiary,
                  ),
                ));
          }).toList(),
          onChanged: (value) => setState(() {
                this.value = value;
              })),
    );
  }
}

List<String> skinType = [
  'Жирная',
  'Комбинированная',
  'Сухая',
  'Нормальная',
  'Любая',
];
List<String> productType = [
  'Маска',
  'Крем',
  'Сыворотка',
  'Молочко',
  'Тонер',
];

List<String> skinProblem = [
  "Обезвоженность",
  "Тусклость",
  "Чувствительность",
  "Акне",
  "Морщины",
  "Покраснения",
  "Сухость",
];

List<String> cosmeticsLine = [
  "Christina",
  "Christina Illustrious",
  "Christina Muse",
  "Christina Supreme",
  "Christina Young",
  "Christina Unstress",
];

List<String> effect = [
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

List<String> sortBy = ["по Популярности"];
