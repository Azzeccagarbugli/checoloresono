import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  final String favoriteRegion = 'favoriteRegion';
  final String nameRegion = 'nameRegion';
  final String indexRegion = 'indexRegion';

  Future<void> setFavoriteRegion({bool isFavorite}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(favoriteRegion, isFavorite);
  }

  Future<bool> getFavoriteRegion() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(favoriteRegion) ?? false;
  }

  Future<void> setNameRegion(String nameRegion) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(this.nameRegion, nameRegion);
  }

  Future<String> getNameRegion() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(nameRegion);
  }

  Future<void> setIndexRegion(int indexRegion) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(this.indexRegion, indexRegion);
  }

  Future<int> getIndexRegion() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt(indexRegion);
  }

  Future<void> clear() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.clear();
  }
}
