abstract class GetTranscriptionState {}

final class GetTranscriptionInitial extends GetTranscriptionState {}

final class GetTranscriptionLoading extends GetTranscriptionState {}

final class GetTranscriptionFailure extends GetTranscriptionState {
  final String errorMessage;

  GetTranscriptionFailure({required this.errorMessage});
}

final class GetTranscriptionSuccess extends GetTranscriptionState {
  final String transcription;
  GetTranscriptionSuccess({required this.transcription});
}
