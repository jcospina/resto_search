import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_search/model/app,model.dart';
import 'package:restaurant_search/screens/login.screen.dart';
import 'package:restaurant_search/screens/restaurant-search.screen.dart';
import 'package:restaurant_search/theme/app.theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyAppState(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: myAppTheme,
        home: LoginScreen(),
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          RestaurantSearchScreen.id: (context) => RestaurantSearchScreen()
        },
      ),
    );
  }
}
