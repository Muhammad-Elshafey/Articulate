import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:articulate/features/profile/data/repos/user_repo.dart';
part 'get_user_data_state.dart';

class GetUserDataCubit extends Cubit<GetUserDataState> {
  GetUserDataCubit({required this.userRepo}) : super(GetUserDataInitial());

  final UserRepo userRepo;

  String name = '';
  String? phoneNumber;
  String imageUrl = '';

  Future<void> getUserData({required String token}) async {
    emit(GetUserDataLoading());
    var result = await userRepo.getUserInfo(bearerToken: token);
    result.fold(
      (failure) {
        emit(GetUserDataFailure(errorMessage: failure.errorMessage));
      },
      (success) {
        name = success.name!;
        phoneNumber = success.phoneNumber;
        emit(GetUserDataSuccess());
      },
    );
  }
}
