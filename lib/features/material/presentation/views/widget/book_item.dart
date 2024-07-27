import 'package:articulate/features/material/data/books_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/common/functions.dart';
import '../../../../../core/utils/text_styles.dart';

class BookItem extends StatelessWidget {
  final BooksModel booksModel;
  const BookItem({
    super.key,
    required this.booksModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Functions.openWebView(
          context: context, url: booksModel.url, text: 'Books'),
      child: Container(
        height: 120.h,
        width: double.infinity.sw,
        decoration: BoxDecoration(
          color: const Color(0xffF5F5F5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(AssetData.bookCover),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'book : ${booksModel.bookName}',
                        style: Styles.text18Inter.copyWith(
                          color: kBlackColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        'Author : ${booksModel.authorName}',
                        style: Styles.text18Inter.copyWith(
                            color: kBlackColorWithOpacity63, fontSize: 16),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        'Cost : ${booksModel.isFree}',
                        style: Styles.text18Inter.copyWith(
                            color: kBlackColorWithOpacity63, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
