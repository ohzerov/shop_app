import 'package:flutter/material.dart';

class CatalogSearchWidget extends StatelessWidget {
  const CatalogSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2),
          child: Row(
            spacing: 12,
            children: [
              SizedBox(
                width: 24,
                child: Image.asset('assets/icons/search_icon.png'),
              ),
              Expanded(
                  child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    label: Text(
                      'Поиск',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.tertiary),
                    )),
              ))
            ],
          ),
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Theme.of(context).colorScheme.tertiary),
          ),
        ),
      ),
    );
  }
}
