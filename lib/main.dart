import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// screens
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/cart_screen.dart';
// providers
import './providers/products.dart';
import './providers/cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // when ever we instantiate a class, we are creating new Object and provide it to
    // the change notifier. In that case we should use `create` method in ChangeNotifierProvider
    // for efficency and because of bugs. When we reuse an existing object we should use `ChangeNotifierProvider.value()`
    return MultiProvider(
      // Recomended approach
      providers: [
        ChangeNotifierProvider(create: (ctx) => Products()),
        ChangeNotifierProvider(create: (ctx) => Cart()),
      ],
      // Other approach
      // providers: [
      //   ChangeNotifierProvider.value(value: Products()),
      //   ChangeNotifierProvider.value(value: Cart()),
      // ],
      // all children can access providers we defined above, parent/child tree
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
        },
      ),
    );
  }
}
