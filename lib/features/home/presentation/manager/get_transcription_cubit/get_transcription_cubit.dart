import 'package:articulate/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'get_transcription_state.dart';

class GetTranscriptionCubit extends Cubit<GetTranscriptionState> {
  final HomeRepo homeRepo;
  String text = '';
  GetTranscriptionCubit({required this.homeRepo})
      : super(GetTranscriptionInitial());
  Future<void> getTranscriptionMethod({required String word}) async {
    emit(GetTranscriptionLoading());
    var data = await homeRepo.getTranscription(word: word);
    data.fold(
        (failure) => emit(
              GetTranscriptionFailure(errorMessage: failure.errorMessage),
            ), (success) {
      text = '/$success/';
      emit(
        GetTranscriptionSuccess(transcription: success),
      );
    });
  }
}
