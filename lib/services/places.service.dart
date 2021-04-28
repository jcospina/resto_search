import 'package:google_place/google_place.dart';

class PlacesService {
  static final apiKey = 'AIzaSyBIZUl8v8CLJOny9dSk6LcwjqwmTBQ-57c';
  GooglePlace places;

  static final PlacesService _placesService =
      PlacesService._internalConstructor();
  factory PlacesService() {
    return _placesService;
  }

  PlacesService._internalConstructor();

  init() {
    places = GooglePlace(apiKey);
  }

  Future<List<SearchResult>> getPlaces(String searchString) async {
    TextSearchResponse textSearchResponse = await places.search.getTextSearch(
      searchString,
      type: 'restaurant',
    );
    return textSearchResponse.results;
  }
}
