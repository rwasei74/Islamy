import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsUtils {
  static const String mostRecentKey = 'most_recent';
}

void saveSuraIndex(int newSuraIndex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  

  List<String> mostrecentlist = prefs.getStringList(SharedPrefsUtils.mostRecentKey) ?? [];


  String newIndexStr = '$newSuraIndex';
  if (mostrecentlist.contains(newIndexStr)) {
    mostrecentlist.remove(newIndexStr);
  }
  mostrecentlist.insert(0, newIndexStr);

  if (mostrecentlist.length > 10) {
    mostrecentlist = mostrecentlist.sublist(0, 10);
  }

  await prefs.setStringList(SharedPrefsUtils.mostRecentKey, mostrecentlist);
}

Future<List<int>> getMostRecentList() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> mostrecentlistAsString = prefs.getStringList(SharedPrefsUtils.mostRecentKey) ?? [];
  
  return mostrecentlistAsString.map((element) => int.parse(element)).toList();
}
