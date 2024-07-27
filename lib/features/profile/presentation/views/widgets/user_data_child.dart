import 'package:articulate/core/utils/widgets/gradient_button.dart';
import 'package:articulate/features/auth/presentation/views/log_in_view.dart';
import 'package:articulate/features/profile/presentation/manager/update_user_data_cubit/update_user_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constant.dart';
import '../../../../../core/data_base/cache_helper.dart';
import '../../../../../core/services/service_locator.dart';
import '../../../../../core/utils/common/functions.dart';
import '../../../../../core/utils/widgets/custom_text_field.dart';
import '../../../../auth/data/models/auth_model/auth_model.dart';
import 'user_button.dart';

class UserDataChildWidget extends StatefulWidget {
  final String name;
  final String phoneNumber;

  const UserDataChildWidget({
    required this.name,
    required this.phoneNumber,
    Key? key,
  }) : super(key: key);

  @override
  State<UserDataChildWidget> createState() => _UserDataChildWidgetState();
}

class _UserDataChildWidgetState extends State<UserDataChildWidget> {
  AuthModel? authModel;
  String? token;
  bool readOnly = true;
  @override
  void initState() {
    _fetchUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var updateUserDataCubit = BlocProvider.of<UpdateUserDataCubit>(context);
    return Column(
      children: [
        SizedBox(height: 65.h),
        CustomTextField(
          hintText: widget.name,
          textFiledName: 'Name',
          controller: updateUserDataCubit.nameController,
          labelText: 'Name',
          color: kBlackColor,
          readOnly: readOnly,
        ),
        SizedBox(height: 25.h),
        CustomTextField(
          hintText: widget.phoneNumber,
          textFiledName: 'Phone number',
          controller: updateUserDataCubit.phoneNumberController,
          labelText: 'Phone number',
          color: kBlackColor,
          readOnly: readOnly,
        ),
        SizedBox(height: 25.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            UserButton(
              text: 'Switch Account',
              onPressed: () {
                clearData();
                Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginView(),
                  ),
                );
              },
              color: kBlueColor,
              textColor: kBlueColor,
              backgroundColor: kWhiteColor,
            ),
            UserButton(
              text: 'Exit',
              onPressed: () async {
                SystemNavigator.pop();
              },
              color: kWhiteColor,
              textColor: kWhiteColor,
              backgroundColor: kBlueColor,
            ),
          ],
        ),
        SizedBox(height: 25.h),
        //TODO
        BlocConsumer<UpdateUserDataCubit, UpdateUserDataState>(
          listener: (BuildContext context, UpdateUserDataState state) {
            if (state is UpdateUserDataFailure) {
              Functions.showToastMessage(message: state.errorMessage);
            }
          },
          builder: (context, state) {
            return MaterialButtonWidget(
              buttonText: readOnly == true ? 'Enable editing' : 'Update Data',
              onPressed: () {
                if (readOnly == true) {
                  readOnly = false;
                  setState(() {});
                } else {
                  updateUserDataCubit.updateUserData(bearerToken: token!);
                }
              },
              isLoading: state is UpdateUserDataLoading ? true : false,
            );
          },
        ),
      ],
    );
  }

  Future<bool> clearData() async => await getIt<CacheHelper>().clearData();

  Future<void> _fetchUserData() async {
    authModel = await getIt<CacheHelper>().getAuthModel();
    setState(() {});
    token = authModel!.tokens!.access;
  }
}
