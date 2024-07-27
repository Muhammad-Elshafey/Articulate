import 'package:articulate/core/utils/assets.dart';
import 'package:articulate/features/material/data/articles_model.dart';
import 'package:articulate/features/material/data/books_model.dart';
import 'package:articulate/features/material/data/courses_model.dart';
import 'package:flutter/material.dart';
import 'widget/tab_widget.dart';

class MaterialViewBody extends StatelessWidget {
  const MaterialViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        const TabViewWidget(
          title: 'Listening',
          subTitle: '5 Listening Websites Available',
          imagePath: AssetData.listeningCover,
          listViewTitle: 'Listening',
          isListening: true,
          about:
              'Immerse yourself in native\nspeech! Podcasts, audio books\nand movies can help you train\nyour ear for natural pronunciation\nrhythms and intonations',
        ),
        TabViewWidget(
          title: 'Courses',
          subTitle: '${CoursesModel.courseList.length} Courses Available',
          imagePath: AssetData.courses,
          listViewTitle: 'Courses',
          isCourse: true,
          about:
              'Get structured learning with\nonline courses.These can\nprovide in-depth explanations of\nspecific sounds, along with practice\nexercises and expert guidance',
        ),
        TabViewWidget(
          title: 'Bookshelf',
          subTitle: '${BooksModel.booksList.length} Books Available',
          imagePath: AssetData.book,
          listViewTitle: 'Featured Books',
          isBook: true,
          about:
              'Dive deeper with pronunciation\nguides and textbooks.\nThese resources offer detailed\nvisual explanations of sounds, along\nwith exercises to solidify your learning',
        ),
        TabViewWidget(
          title: 'Articles',
          subTitle: '${ArticlesModel.articlesList.length} Articles Available',
          imagePath: AssetData.article,
          listViewTitle: 'Articles',
          isArticle: true,
          about:
              'Stay informed with pronunciation\ntips and tricks.\nArticles can offer quick insights\non specific challenges and strategies\nfor improvement.',
        ),
        const TabViewWidget(
          title: 'Games',
          subTitle: '1 Game Available',
          imagePath: AssetData.game,
          listViewTitle: 'Games',
          isGame: true,
          about:
              'Make learning fun with\ninteractive pronunciation games.\nThese can test your listening skills\nidentify areas for improvement\nand keep you engaged in\nthe learning process',
        ),
      ],
    );
  }
}
