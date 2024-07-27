import 'package:flutter/material.dart';

import '../../../data/books_model.dart';
import 'book_item.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: BooksModel.booksList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 1 / 1.6,
      ),
      itemBuilder: (context, index) {
        return BookItem(booksModel: BooksModel.booksList[index]);
      },
    );
  }
}
