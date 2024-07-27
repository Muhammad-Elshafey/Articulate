import 'package:articulate/features/material/data/courses_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/common/functions.dart';
import '../../../../../core/utils/text_styles.dart';
import 'rating_row.dart';

class CourseItem extends StatelessWidget {
  final CoursesModel coursesModel;
  const CourseItem({super.key, required this.coursesModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Functions.openWebView(
          context: context, url: coursesModel.url, text: 'Courses'),
      child: Container(
        width: double.infinity.sw,
        height: 120.h,
        decoration: BoxDecoration(
          color: const Color(0xffF5F5F5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(AssetData.courseCover),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        coursesModel.courseName,
                        style: Styles.text18Inter.copyWith(
                            color: kBlackColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        '${coursesModel.numberOfVideos} Lessons',
                        style: Styles.text18Inter.copyWith(
                            color: kBlackColorWithOpacity63, fontSize: 16),
                      ),
                      SizedBox(height: 3.h),
                      Row(
                        children: [
                          Text(
                            'Cost : ${coursesModel.isFree}',
                            style: Styles.text18Inter.copyWith(
                                color: kBlackColorWithOpacity63, fontSize: 16),
                          ),
                          SizedBox(width: 10.w),
                          RatingRow(rate: coursesModel.rate),
                        ],
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
