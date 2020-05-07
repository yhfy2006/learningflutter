import 'package:flutter/material.dart';
import 'package:shop/widgets/product_grid.dart';


class ProductsOverviewScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: AppBar(title: Text('MyShop')),
      body: new ProductsGrid(),
    );
    return scaffold;
  }
}


