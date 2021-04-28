import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_search/model/app,model.dart';
import 'package:restaurant_search/screens/restaurant-search.screen.dart';
import 'package:restaurant_search/services/auth.service.dart';
import 'package:restaurant_search/theme/app.theme.dart';

import 'login.screen.dart';

class RestoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyAppState(),
      child: StreamBuilder(
          stream: AuthService().authStateChanges,
          builder: (context, snapshot) {
            Widget _initialRoute =
                snapshot.hasData ? RestaurantSearchScreen() : LoginScreen();
            return MaterialApp(
              title: 'Flutter Demo',
              theme: myAppTheme,
              home: _initialRoute,
              routes: {
                LoginScreen.id: (context) => LoginScreen(),
                RestaurantSearchScreen.id: (context) => RestaurantSearchScreen()
              },
            );
          }),
    );
  }
}
