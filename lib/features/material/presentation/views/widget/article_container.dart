import 'package:articulate/core/utils/common/functions.dart';
import 'package:articulate/features/material/data/articles_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/text_styles.dart';

class CustomArticleContainer extends StatelessWidget {
  final ArticlesModel articlesModel;
  const CustomArticleContainer({
    super.key,
    required this.articlesModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Functions.openWebView(
          context: context, url: articlesModel.url, text: 'Articles'),
      child: Container(
        width: double.infinity.sw,
        height: 120.h,
        decoration: BoxDecoration(
          color: const Color(0xffF5F5F5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(AssetData.articleCover, height: 100.h),
              ),
              SizedBox(width: 6.w),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        articlesModel.articleName,
                        style: Styles.text18Inter.copyWith(
                            color: kBlackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        'Author : ${articlesModel.authorName}',
                        style: Styles.text18Inter.copyWith(
                          color: kBlackColorWithOpacity63,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        'Website : ${articlesModel.webSite}',
                        style: Styles.text18Inter.copyWith(
                          color: kBlackColorWithOpacity63,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        overflow: TextOverflow.ellipsis,
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
