import 'package:articulate/features/material/data/books_model.dart';
import 'package:articulate/features/material/presentation/manager/search_cubit/search_cubit.dart';
import 'package:articulate/features/material/presentation/manager/search_cubit/search_state.dart';
import 'package:articulate/features/material/presentation/views/widget/book_item.dart';
import 'package:articulate/features/material/presentation/views/widget/listen_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/articles_model.dart';
import '../../../data/courses_model.dart';
import 'article_container.dart';
import 'course_container.dart';

class CustomListView extends StatelessWidget {
  final bool isArticles;
  final bool isBook;
  final bool isCourse;
  const CustomListView({
    super.key,
    required this.isArticles,
    required this.isBook,
    required this.isCourse,
  });

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<SearchCubit>(context);
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is GetFilteredListeningData) {
          return SliverList.builder(
            itemCount: state.listeningList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ListenContainer(
                  listenModel: state.listeningList[index],
                ),
              );
            },
          );
        }
        if (state is GetFilteredCoursesData) {
          return SliverList.builder(
            itemCount: state.coursesList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: CourseItem(
                  coursesModel: state.coursesList[index],
                ),
              );
            },
          );
        }
        if (state is GetFilteredArticlesData) {
          return SliverList.builder(
            itemCount: state.articlesList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: CustomArticleContainer(
                  articlesModel: state.articlesList[index],
                ),
              );
            },
          );
        }
        if (state is GetFilteredBooksData) {
          return SliverList.builder(
            itemCount: state.booksList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: BookItem(
                  booksModel: state.booksList[index],
                ),
              );
            },
          );
        }
        return SliverList.builder(
          itemCount: isArticles
              ? ArticlesModel.articlesList.length
              : isBook
                  ? BooksModel.booksList.length
                  : isCourse
                      ? CoursesModel.courseList.length
                      : bloc.listeningList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: isArticles
                  ? CustomArticleContainer(
                      articlesModel: ArticlesModel.articlesList[index],
                    )
                  : isBook
                      ? BookItem(
                          booksModel: BooksModel.booksList[index],
                        )
                      : isCourse
                          ? CourseItem(
                              coursesModel: CoursesModel.courseList[index],
                            )
                          : ListenContainer(
                              listenModel: bloc.listeningList[index],
                            ),
            );
          },
        );
      },
    );
  }
}
