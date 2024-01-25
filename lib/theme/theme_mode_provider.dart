
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Mode{
  system,
  dark,
  light
}

class ThemeModeProvider extends ChangeNotifier{
  Mode _themeValue = Mode.system;
  String valueSharedPreferences = 'mode';
  List<Mode> items = Mode.values;

  Mode get themeValue => _themeValue;

  set themeValue(Mode themeSelect){
    _themeValue=themeSelect;
    notifyListeners();
  }

  Future<void> setThemeMode()async{
    setThemeValue(await getThemeMode());
    notifyListeners();
  }

  setThemeValue(String? savedMode){
    if(savedMode==null){
      _themeValue=Mode.system;
    }
    else if(savedMode == 'light'){
      _themeValue=Mode.light;
    }
    else{
      _themeValue=Mode.dark;
    }
    notifyListeners();
  }

  Future<String?> getThemeMode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(valueSharedPreferences);
  }

   Future<bool> saveMode(String value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(valueSharedPreferences, value);
  }

  void changeMode(Mode mode)async{
    _themeValue=mode;
    await saveMode(mode.name);
    notifyListeners();
  }
}