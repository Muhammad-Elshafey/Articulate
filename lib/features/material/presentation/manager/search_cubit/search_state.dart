import 'package:articulate/features/material/data/articles_model.dart';
import 'package:articulate/features/material/data/books_model.dart';
import 'package:articulate/features/material/data/courses_model.dart';

import '../../../data/listen_model.dart';

abstract class SearchState {}

final class SearchInitial extends SearchState {}

final class GetFilteredListeningData extends SearchState {
  final List<ListenModel> listeningList;

  GetFilteredListeningData({required this.listeningList});
}

final class GetFilteredCoursesData extends SearchState {
  final List<CoursesModel> coursesList;

  GetFilteredCoursesData({required this.coursesList});
}

final class GetFilteredBooksData extends SearchState {
  final List<BooksModel> booksList;
  GetFilteredBooksData({required this.booksList});
}

final class GetFilteredArticlesData extends SearchState {
  final List<ArticlesModel> articlesList;

  GetFilteredArticlesData({required this.articlesList});
}
