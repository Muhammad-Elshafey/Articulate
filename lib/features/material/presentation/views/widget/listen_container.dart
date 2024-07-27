import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/common/functions.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../data/listen_model.dart';

class ListenContainer extends StatelessWidget {
  final ListenModel listenModel;
  const ListenContainer({super.key, required this.listenModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Functions.openWebView(
          context: context, url: listenModel.url, text: 'Listening'),
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
                child: Image.asset(AssetData.listenImage),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        listenModel.webSiteName,
                        style: Styles.text18Inter.copyWith(
                            color: kBlackColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        listenModel.description,
                        style: Styles.text18Inter.copyWith(
                            color: kGreyColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                        maxLines: 3,
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
