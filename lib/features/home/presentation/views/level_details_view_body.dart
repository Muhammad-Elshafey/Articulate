import 'dart:async';

import 'package:articulate/features/home/presentation/views/widget/lesson_container_child.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/common/enum_level.dart';
import 'widget/header_widget_level.dart';
import 'widget/lesson_container.dart';
import 'widget/no_internet_widget.dart';

class LevelDetailsViewBody extends StatefulWidget {
  final DetermineLevel determineLevel;
  const LevelDetailsViewBody({super.key, required this.determineLevel});

  @override
  State<LevelDetailsViewBody> createState() => _LevelDetailsViewBodyState();
}

class _LevelDetailsViewBodyState extends State<LevelDetailsViewBody> {
  ConnectivityResult? _connectivityResult;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  @override
  void initState() {
    super.initState();
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      setState(() {
        _connectivityResult = result;
      });
    });
    checkCon();
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  void checkCon() async {
    var con = await Connectivity().checkConnectivity();
    setState(() {
      _connectivityResult = con;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _connectivityResult == ConnectivityResult.none
        ? const NoInternetWidget()
        : StreamBuilder<ConnectivityResult>(
            stream: Connectivity().onConnectivityChanged,
            builder: (BuildContext context,
                AsyncSnapshot<ConnectivityResult> snapshot) {
              return snapshot.data == ConnectivityResult.none
                  ? const NoInternetWidget()
                  : SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          children: [
                            SizedBox(height: 20.h),
                            HeaderWidget(determineLevel: widget.determineLevel),
                            SizedBox(height: 15.h),
                            const LessonsContainer(
                              child: LessonContainerChild(),
                            ),
                            SizedBox(height: 10.h),
                          ],
                        ),
                      ),
                    );
            },
          );
  }
}
