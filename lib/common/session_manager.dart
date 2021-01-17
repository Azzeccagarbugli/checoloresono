import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  final String favoriteRegion = 'favoriteRegion';

  Future<void> setFavoriteRegion(bool isFavorite) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(this.favoriteRegion, isFavorite);
  }

  Future<bool> getFavoriteRegion() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    bool status = pref.getBool(this.favoriteRegion) ?? false;
    return status;
  }
}
