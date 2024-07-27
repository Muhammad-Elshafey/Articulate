import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/home_repo.dart';
import 'text_to_speech_state.dart';

class TextToSpeechCubit extends Cubit<TextToSpeechState> {
  final HomeRepo homeRepo;
  TextToSpeechCubit({required this.homeRepo}) : super(TextToSpeechInitial());
  Future<void> textToSpeech({required String word}) async {
    emit(TextToSpeechLoading());
    var data = await homeRepo.getSpeech(word: word);
    data.fold(
      (failure) => emit(
        TextToSpeechFailure(errorMessage: failure.errorMessage),
      ),
      (success) => emit(
        TextToSpeechSuccess(audioPath: success),
      ),
    );
  }
}
