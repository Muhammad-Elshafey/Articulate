import 'dart:developer';
import 'dart:io';
import 'package:articulate/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'assess_pronunciation_state.dart';

class AssessPronunciationCubit extends Cubit<AssessPronunciationState> {
  final HomeRepo homeRepo;
  double testScore = 0;
  AssessPronunciationCubit({required this.homeRepo})
      : super(AssessPronunciationInitial());
  Future<void> assessPronunciation(
      {required File audio, required String referenceText}) async {
    emit(AssessPronunciationLoading());
    var result = await homeRepo.assessPronunciation(
        audio: audio, referenceText: referenceText);
    result.fold(
        (failure) => emit(
            AssessPronunciationFailure(errorMessage: failure.errorMessage)),
        (success) {
      userVisible = true;
      userTranscription = success[1];
      testScore += double.parse(success[0]);
      visible = true;
      index++;
      if (index == 1) {
        visible1 = true;
        double parsedNumber = double.parse(success[0]);
        score1 = parsedNumber.toStringAsFixed(2);
        percent1 = double.parse(success[0]) / 100;
      } else if (index == 2) {
        visible2 = true;
        double parsedNumber = double.parse(success[0]);
        score2 = parsedNumber.toStringAsFixed(2);
        percent2 = double.parse(success[0]) / 100;
      } else if (index == 3) {
        visible3 = true;
        double parsedNumber = double.parse(success[0]);
        score3 = parsedNumber.toStringAsFixed(2);
        percent3 = double.parse(success[0]) / 100;
      }
      emit(AssessPronunciationSuccess(response: success));
    });
  }

  AudioRecorder audioRecord = AudioRecorder();
  String audioPath = "";
  Future<void> startRecording() async {
    try {
      if (await audioRecord.hasPermission()) {
        final directory = await getExternalStorageDirectory();
        final path = File(
            '${directory!.path}/recording_${DateTime.now().millisecondsSinceEpoch}.mp3');
        emit(StartRecording());
        await audioRecord.start(const RecordConfig(), path: path.path);
      }
    } catch (ex) {
      log('Error start recording : $ex');
    }
  }

  Future<void> stopRecording({required String referenceText}) async {
    try {
      final path = await audioRecord.stop();
      if (path != null) {
        audioPath = path;
        assessPronunciation(
            audio: File(audioPath), referenceText: referenceText);
      } else {
        log('Recording failed');
      }
    } catch (ex) {
      log('Error stop recording : $ex');
    }
  }

  String userTranscription = '';
  bool visible = false;
  bool visible1 = false;
  bool visible2 = false;
  bool visible3 = false;
  bool userVisible = false;
  int index = 0;
  double percent1 = 0;
  double percent2 = 0;
  double percent3 = 0;
  String score1 = '';
  String score2 = '';
  String score3 = '';
  void rest() {
    visible = false;
    visible1 = false;
    visible2 = false;
    visible3 = false;
    userVisible = false;
    index = 0;
    percent1 = 0;
    percent2 = 0;
    percent3 = 0;
    score1 = '';
    score2 = '';
    score3 = '';
    emit(AssessPronunciationInitial());
  }
}
