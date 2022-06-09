import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'color_state.dart';

class ColorCubit extends Cubit<ColorState> {
  ColorCubit() : super(ColorState.initial());
  void changeColor() {
    if (state.color == Colors.red) {
      emit(state.copyWith(Colors.green));
    } else if (state.color == Colors.green) {
      emit(state.copyWith(Colors.blue));
    } else if (state.color == Colors.blue) {
      emit(state.copyWith(Colors.black));
    } else if (state.color == Colors.black) {
      emit(state.copyWith(Colors.red));
    }
  }
}
