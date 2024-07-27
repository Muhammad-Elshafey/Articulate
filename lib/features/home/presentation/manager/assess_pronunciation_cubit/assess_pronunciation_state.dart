abstract class AssessPronunciationState {}

class AssessPronunciationInitial extends AssessPronunciationState {}

class AssessPronunciationLoading extends AssessPronunciationState {}

class AssessPronunciationFailure extends AssessPronunciationState {
  final String errorMessage;

  AssessPronunciationFailure({required this.errorMessage});
}

class AssessPronunciationSuccess extends AssessPronunciationState {
  final List<String> response;

  AssessPronunciationSuccess({required this.response});
}

class StartRecording extends AssessPronunciationState {}