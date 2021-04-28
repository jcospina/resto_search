import 'package:cloud_firestore/cloud_firestore.dart';

class SearchRecords {
  static final SearchRecords _searchRecords =
      SearchRecords._internalConstructor();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference _searchRecordsCollection;

  factory SearchRecords() {
    return _searchRecords;
  }

  init() {
    _searchRecordsCollection = _firestore.collection('search-records');
  }

  SearchRecords._internalConstructor();

  addRecord(String newSearch) {
    _searchRecordsCollection.add({
      'search': newSearch,
      'timestamp': DateTime.now().millisecondsSinceEpoch
    });
  }
}
