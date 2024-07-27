import 'package:articulate/core/data_base/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constant.dart';
import '../../../../../core/services/service_locator.dart';
import '../../../../../core/utils/app_strings.dart';

import '../../../../../core/utils/common/functions.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/utils/widgets/progress_indicator.dart';
import '../../../../auth/data/models/auth_model/auth_model.dart';
import '../../../../profile/presentation/manager/get_user_data_cubit/get_user_data_cubit.dart';

class CustomHomeAppBar extends StatefulWidget {
  const CustomHomeAppBar({super.key});

  @override
  State<CustomHomeAppBar> createState() => _CustomHomeAppBarState();
}

class _CustomHomeAppBarState extends State<CustomHomeAppBar> {
  AuthModel? authModel;

  @override
  void initState() {
    _fetchUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<GetUserDataCubit>(context);
    return BlocConsumer<GetUserDataCubit, GetUserDataState>(
      listener: (context, state) {
        if (state is GetUserDataFailure) {
          Functions.showToastMessage(message: state.errorMessage);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 15),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: kBlueColor3,
                child: CircleAvatar(
                  backgroundColor: kWhiteColor,
                  radius: 17.r,
                  child: state is GetUserDataLoading
                      ? SizedBox(
                          height: 16.h,
                          width: 15.w,
                          child: const CustomCircularProgressIndicator(
                              color: kBlackColor),
                        )
                      : CircleAvatar(
                          radius: 17.r,
                          backgroundColor: kWhiteColor,
                          backgroundImage: NetworkImage(
                            bloc.imageUrl.isEmpty
                                ? 'https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png'
                                : 'https://youssifallam.pythonanywhere.com${bloc.imageUrl}',
                          ),
                        ),
                ),
              ),
              SizedBox(width: 15.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, ${bloc.name}',
                    style: Styles.text20.copyWith(
                      color: kBlackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    AppStrings.newJourneyText,
                    style: Styles.text18.copyWith(
                      color: kBlackColorWithOpacity63,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _fetchUserData() async {
    authModel = await getIt<CacheHelper>().getAuthModel();
    setState(() {});
    if (mounted) {
      BlocProvider.of<GetUserDataCubit>(context)
          .getUserData(token: '${authModel!.tokens!.access}');
    }
  }
}
