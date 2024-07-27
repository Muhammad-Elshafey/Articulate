import 'dart:io';

import 'package:articulate/features/profile/data/models/user_info.dart';
import 'package:articulate/features/profile/data/repos/user_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_user_data_state.dart';

class UpdateUserDataCubit extends Cubit<UpdateUserDataState> {
  final UserRepo userRepo;
  UpdateUserDataCubit({required this.userRepo})
      : super(UpdateUserDataInitial());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  File? imageFile;
  Future<void> updateUserData(
      {required String bearerToken}) async {
    emit(UpdateUserDataLoading());
    var result = await userRepo.updateUserData(
      name: nameController.text,
      phoneNumber: phoneNumberController.text,
      bearerToken: bearerToken,
      image: await MultipartFile.fromFile(imageFile!.path),
    );
    result.fold((failure) {
      emit(UpdateUserDataFailure(errorMessage: failure.errorMessage));
    }, (success) {
      emit(UpdateUserDataSuccess(userInfo: success));
    });
  }
}
