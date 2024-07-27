import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'validate_state.dart';

class ValidateCubit extends Cubit<ValidateState> {
  ValidateCubit() : super(ValidateInitial());
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  void validateForm() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      emit(ValidateSuccess());
    } else {
      emit(ValidateFailure());
    }
  }
}
