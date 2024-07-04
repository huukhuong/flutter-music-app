import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void updateTheme(ThemeMode themeMode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('themeMode', themeMode.toString());
    return emit(themeMode);
  }

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    return null;
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    return null;
  }
}
