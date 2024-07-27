import 'package:articulate/features/material/presentation/views/widget/game_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../constant.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/utils/widgets/gradient_text.dart';
import '../../manager/search_cubit/search_cubit.dart';
import 'container.dart';
import 'list_view.dart';
import 'search_widget.dart';

class TabViewWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String about;
  final String listViewTitle;
  final String imagePath;
  final bool isArticle;
  final bool isBook;
  final bool isGame;
  final bool isCourse;
  final bool isListening;
  const TabViewWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.imagePath,
    required this.listViewTitle,
    this.isArticle = false,
    this.isBook = false,
    this.isGame = false,
    this.isCourse = false,
    this.isListening = false,
    required this.about,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 5.h)),
              SliverToBoxAdapter(
                child: Text(
                  title,
                  style: Styles.text30Inter.copyWith(fontSize: 24),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 5.h)),
              SliverToBoxAdapter(
                child: Text(
                  subTitle,
                  style: Styles.text18Inter
                      .copyWith(color: kBlackColorWithOpacity63, fontSize: 18),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 10.h)),
              SliverToBoxAdapter(
                child: SearchWidget(onChanged: (value) {
                  isCourse
                      ? BlocProvider.of<SearchCubit>(context)
                          .coursesSearch(query: value)
                      : isBook
                          ? BlocProvider.of<SearchCubit>(context)
                              .booksSearch(query: value)
                          : isArticle
                              ? BlocProvider.of<SearchCubit>(context)
                                  .articlesSearch(query: value)
                              : BlocProvider.of<SearchCubit>(context)
                                  .listeningSearch(query: value);
                }),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 35.h)),
              SliverToBoxAdapter(
                  child: CustomMaterialContainer(
                imagePath: imagePath,
                isGame: isGame,
                isListening: isListening,
                about: about,
              )),
              SliverToBoxAdapter(child: SizedBox(height: 20.h)),
              SliverToBoxAdapter(
                child: GradientText(
                  text: listViewTitle,
                  gradient: startScreenContainer2LinearGradient,
                  style: Styles.text18Inter
                      .copyWith(fontSize: 22, fontWeight: FontWeight.w700),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 20.h)),
              if (!isGame)
                CustomListView(
                  isArticles: isArticle,
                  isBook: isBook,
                  isCourse: isCourse,
                ),
              if (isGame) const SliverToBoxAdapter(child: GameView()),
            ],
          ),
        ),
      ],
    );
  }
}
