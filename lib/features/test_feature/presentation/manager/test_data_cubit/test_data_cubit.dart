import 'package:articulate/features/test_feature/data/repos/test_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'test_data_state.dart';

class TestDataCubit extends Cubit<TestDataState> {
  final TestRepo testRepo;
  TestDataCubit({required this.testRepo}) : super(TestDataInitial());
  int currentIndex = 0;
  int wordNumber = 1;
  String word = '';
  List<String> data = [];
  Future<void> getData() async {
    emit(GetDataLoading());
    var response = await testRepo.getReadingTestData();
    response.fold(
      (failure) => emit(GetDataFailure(errorMessage: failure.errorMessage)),
      (success) {
        data = success;
        word = data[0];
        currentIndex = 0;
        emit(GetDataSuccess());
      },
    );
  }

  void getWord() {
    if (currentIndex < data.length - 1) {
      wordNumber++;
      currentIndex++;
      word = data[currentIndex];
      emit(TestNewData());
    }
    if (currentIndex == data.length - 1) {
      emit(TestFinished());
    }
  }
}
