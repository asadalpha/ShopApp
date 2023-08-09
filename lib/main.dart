import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/view/homepage.dart';

import 'models/cartmodel.dart';

void main() {
  runApp(const ShopApp());
}

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: const HomePage(),
      ),
    );
  }
}
