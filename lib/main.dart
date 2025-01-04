import 'package:flutter/material.dart';
import 'package:shop_app/core/theme.dart';
import 'package:shop_app/features/catalog_tab/presentation/filter_provider_widget.dart';
import 'package:shop_app/features/main_wrapper/presentation/main_wrapper.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: MainWrapper(),
    );
  }
}
