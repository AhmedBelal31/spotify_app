import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ChooseModeCubit extends HydratedCubit<ThemeMode> {
  ChooseModeCubit() : super(ThemeMode.system);

  void changeMode(ThemeMode mode) => emit(mode);

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    return ThemeMode.values[json['themeMode'] as int];
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    return {
      'themeMode': state.index,
    };
  }
}
