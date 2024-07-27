import 'package:articulate/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'lesson_data_state.dart';

class LessonDataCubit extends Cubit<LessonDataState> {
  final HomeRepo homeRepo;
  List<String> words = [];
  String word = '';
  LessonDataCubit({required this.homeRepo}) : super(LessonDataInitial());
  Future<void> getDataForLessons(
      {required int index, required String endPoint}) async {
    emit(LessonDataLoading());
    var data = await homeRepo.getLessonData(index: index, endPoint: endPoint);
    data.fold(
        (failure) =>
            emit(LessonDataFailure(errorMessage: failure.errorMessage)),
        (success) {
      word = success[0];
      words = success;
      emit(
        LessonDataSuccess(data: success),
      );
    });
  }

  int wordIndex = 0;
  void getNextWord() {
    if (wordIndex < words.length - 1) {
      wordIndex++;
      word = words[wordIndex];
      emit(GetNextWord());
    }
  }
}
