import 'package:articulate/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'articulate.dart';
import 'core/bloc_observer/bloc_observer.dart';
import 'core/data_base/cache_helper.dart';
import 'core/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await getIt<CacheHelper>().init();
  Bloc.observer = SimpleBlocObserver();
  Gemini.init(apiKey: kGeminiApiKey);
  runApp(const Articulate());
}
