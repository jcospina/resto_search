import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:google_place/google_place.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_search/model/app,model.dart';
import 'package:restaurant_search/services/auth.service.dart';
import 'package:restaurant_search/services/places.service.dart';
import 'package:restaurant_search/widgets/restaurant.widget.dart';

class RestaurantSearchScreen extends StatefulWidget {
  static String id = '/restaurants';

  @override
  _RestaurantSearchScreenState createState() => _RestaurantSearchScreenState();
}

class _RestaurantSearchScreenState extends State<RestaurantSearchScreen> {
  SearchBar searchBar;
  bool loadingPlaces = false;
  List<SearchResult> places = [];

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: searchBar.getSearchAction(context),
      title: Text('Resto App'),
      actions: [
        IconButton(
          icon: Icon(Icons.logout),
          onPressed: () async {
            context.read<MyAppState>().setLoginState(false);
            await AuthService().logout();
          },
        )
      ],
    );
  }

  _RestaurantSearchScreenState() {
    PlacesService().init();
    searchBar = SearchBar(
      inBar: false,
      setState: setState,
      onSubmitted: (searchTerm) async {
        toggleLoading();
        var searchResults = await PlacesService().getPlaces(searchTerm);
        setState(() {
          places = searchResults;
          toggleLoading();
        });
      },
      buildDefaultAppBar: buildAppBar,
    );
  }

  toggleLoading() {
    setState(() {
      loadingPlaces = !loadingPlaces;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchBar.build(context),
      body: SafeArea(
          child: !loadingPlaces && places.isEmpty
              ? Center(
                  child: Text('Search to find nearby restaurants'),
                )
              : ModalProgressHUD(
                  inAsyncCall: loadingPlaces,
                  child: ListView(
                    children: List<Widget>.generate(
                      places.length,
                      (index) {
                        return Restaurant(
                            title: places[index].name,
                            icon: places[index].icon,
                            rating: places[index].rating);
                      },
                    ),
                  ),
                )),
    );
  }
}
