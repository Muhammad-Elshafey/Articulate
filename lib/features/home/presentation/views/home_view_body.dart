import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widget/bg_widget.dart';
import 'widget/home_app_bar.dart';
import 'widget/levels_container.dart';
import 'widget/levels_list_view.dart';
import 'widget/no_internet_widget.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
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
              if (snapshot.hasData) {
                _connectivityResult = snapshot.data;
              }
              return snapshot.data == ConnectivityResult.none
                  ? const NoInternetWidget()
                  : LineBgWidget(
                      child: Column(
                        children: [
                          const CustomHomeAppBar(),
                          SizedBox(height: 2.h),
                          const HomeLevelsContainer(
                            child: LevelsListView(),
                          ),
                          SizedBox(height: 3.h),
                        ],
                      ),
                    );
            },
          );
  }
}
