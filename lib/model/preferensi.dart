import 'package:shared_preferences/shared_preferences.dart';
import 'mmovies.dart';

class Preferensi{
  static late SharedPreferences _sharedPreferences;

  factory Preferensi() => Preferensi._internal();

  List<String> blankList = [];

  Preferensi._internal();

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  set setNama(String name){
    _sharedPreferences.setString('name', name);
  }

  String get getNama => _sharedPreferences.getString('nama') ?? '';

  set setEmail(String email){
    _sharedPreferences.setString('email', email);
  }

  String get getEmail => _sharedPreferences.getString('email') ?? '';

  set setGenre(List<String> genre){
    _sharedPreferences.setStringList('genre', genre);
  }

  List<String> get getGenre => _sharedPreferences.getStringList('genre') ?? blankList;

  set setLanguage(String lang){
    _sharedPreferences.setString('language', lang);
  }

  String get getLanguage => _sharedPreferences.getString('language') ?? '';

  set setMoviesStatus(int status){
    _sharedPreferences.setInt('Mstatus', status);
  }

  int get getMoviesStatus => _sharedPreferences.getInt('Mstatus') ?? 0;

  set setMoviesID(int id){
    _sharedPreferences.setInt('MID', id);
  }

  int get getMoviesID => _sharedPreferences.getInt('MID') ?? 0;

}