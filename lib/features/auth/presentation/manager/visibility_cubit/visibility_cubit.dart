import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'visibility_state.dart';

class VisibilityCubit extends Cubit<VisibilityState> {
  VisibilityCubit() : super(VisibilityInitial());
  bool obscureText = true;
  IconData? icon = Icons.visibility_off;
  void makePasswordVisible() {
    obscureText = false;
    icon = Icons.visibility;
    emit(MakeIconVisible());
  }

  void makePasswordInvisible() {
    obscureText = true;
    icon = Icons.visibility_off;
    emit(MakeIconInvisible());
  }
}
