import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'timer_state_test.dart';

class TestTimerCubit extends Cubit<TestTimerState> {
  TestTimerCubit() : super(TesTimerCubitInitial());
  Duration testDuration = const Duration(seconds: 15);
  Timer? timerTest;

  void startTimerForTest() {
    testDuration = const Duration(seconds: 15);
    timerTest?.cancel();
    timerTest = Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        if (testDuration.inSeconds > 0) {
          testDuration -= const Duration(seconds: 1);
          emit(TimerCubitStartForTest());
        } else {
          timerTest?.cancel();
          emit(TimerCubitTimeEndForTest());
        }
      },
    );
  }

  void pauseTimerForTest() {
    timerTest?.cancel();
    timerTest = null;
  }
}
