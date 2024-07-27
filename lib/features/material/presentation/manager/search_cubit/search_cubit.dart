import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/articles_model.dart';
import '../../../data/books_model.dart';
import '../../../data/courses_model.dart';
import '../../../data/listen_model.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  List<ListenModel> listeningList = ListenModel.listeningListen;
  List<CoursesModel> coursesList = CoursesModel.courseList;
  List<ArticlesModel> articlesList = ArticlesModel.articlesList;
  List<BooksModel> booksList = BooksModel.booksList;
  void listeningSearch({required String query}) {
    var filtered = listeningList.where((item) {
      return item.webSiteName.toLowerCase().contains(query.toLowerCase()) ||
          item.description.toLowerCase().contains(query.toLowerCase());
    }).toList();
    emit(GetFilteredListeningData(listeningList: filtered));
  }

  void coursesSearch({required String query}) {
    var filtered = coursesList.where((item) {
      return item.courseName.toLowerCase().contains(query.toLowerCase()) ||
          item.isFree.toLowerCase().contains(query.toLowerCase()) ||
          item.numberOfVideos.toLowerCase().contains(query.toLowerCase());
    }).toList();
    emit(GetFilteredCoursesData(coursesList: filtered));
  }

  void articlesSearch({required String query}) {
    var filtered = articlesList.where((item) {
      return item.articleName.toLowerCase().contains(query.toLowerCase()) ||
          item.authorName.toLowerCase().contains(query.toLowerCase()) ||
          item.webSite.toLowerCase().contains(query.toLowerCase());
    }).toList();
    emit(GetFilteredArticlesData(articlesList: filtered));
  }

  void booksSearch({required String query}) {
    var filtered = booksList.where((item) {
      return item.bookName.toLowerCase().contains(query.toLowerCase()) ||
          item.authorName.toLowerCase().contains(query.toLowerCase()) ||
          item.isFree.toLowerCase().contains(query.toLowerCase());
    }).toList();
    emit(GetFilteredBooksData(booksList: filtered));
  }

  void clearSearchResults() {
    listeningList = ListenModel.listeningListen;
    coursesList = CoursesModel.courseList;
    articlesList = ArticlesModel.articlesList;
    booksList = BooksModel.booksList;
    emit(SearchInitial());
  }
}
