abstract class TextToSpeechState {}

final class TextToSpeechInitial extends TextToSpeechState {}

final class TextToSpeechLoading extends TextToSpeechState {}

final class TextToSpeechFailure extends TextToSpeechState {
  final String errorMessage;

  TextToSpeechFailure({required this.errorMessage});
}

final class TextToSpeechSuccess extends TextToSpeechState {
  final String audioPath;

  TextToSpeechSuccess({required this.audioPath});
}
