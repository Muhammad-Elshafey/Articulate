import 'package:articulate/core/utils/widgets/progress_indicator.dart';
import 'package:articulate/features/profile/presentation/manager/get_user_data_cubit/get_user_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/data_base/cache_helper.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/common/functions.dart';
import '../../../auth/data/models/auth_model/auth_model.dart';
import 'widgets/bg_widget.dart';
import 'widgets/user_image.dart';
import 'widgets/user_parent_widget.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({Key? key}) : super(key: key);

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  AuthModel? authModel;

  @override
  void initState() {
    _fetchUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var getUserDataCubit = BlocProvider.of<GetUserDataCubit>(context);
    return BlocConsumer<GetUserDataCubit, GetUserDataState>(
      listener: (context, state) {
        if (state is GetUserDataFailure) {
          Functions.showToastMessage(message: state.errorMessage);
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            const BgWidget(),
            state is GetUserDataLoading
                ? const Center(child: CustomCircularProgressIndicator())
                : UserDataParentWidget(
                    name: getUserDataCubit.name,
                    phoneNumber: getUserDataCubit.phoneNumber ?? '+20********',
                  ),
            UserImageWidget(
              isLoading: state is GetUserDataLoading ? true : false,
              url: getUserDataCubit.imageUrl,
            ),
          ],
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
