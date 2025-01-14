import 'package:flutter/material.dart';
import 'package:shop_app/core/theme.dart';
import 'package:shop_app/core/utils/size_config.dart';
import 'package:shop_app/features/main_wrapper/presentation/main_wrapper.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: MainWrapper(),
    );
  }
}
