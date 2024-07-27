import 'package:articulate/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/lessons_model.dart';
import 'lesson_details_state.dart';

class LessonDetailsCubit extends Cubit<LessonDetailsState> {
  final HomeRepo homeRepo;
  LessonDetailsCubit({required this.homeRepo}) : super(LessonDetailsInitial());
  int index = 0;
  List<LessonsModel> lessons = [];
  Future<void> getLessonDetails({required String endPoint}) async {
    emit(LessonDetailsLoading());
    var data = await homeRepo.lessonsDetails(endPoint: endPoint);
    data.fold((failure) {
      emit(LessonDetailsFailure(errorMessage: failure.errorMessage));
    }, (success) {
      lessons = success;
      emit(LessonDetailsSuccess(details: success));
    });
  }
}
