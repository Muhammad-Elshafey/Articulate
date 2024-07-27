import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/common/functions.dart';
import '../../../../../core/utils/text_styles.dart';

class GameView extends StatelessWidget {
  const GameView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        GameItem(
          url: 'https://www.gamestolearnenglish.com/',
          gameName: 'Games to learn english',
        ),
      ],
    );
  }
}

class GameItem extends StatelessWidget {
  final String url;
  final String gameName;
  const GameItem({
    super.key,
    required this.url,
    required this.gameName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Functions.openWebView(context: context, url: url, text: 'Game'),
      child: Container(
        width: double.infinity.sw,
        height: 123.h,
        decoration: BoxDecoration(
          color: const Color(0xffF5F5F5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(AssetData.gameCover),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Game : $gameName',
                        style: Styles.text18Inter.copyWith(
                            color: kBlackColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        'let\'s Practice some English',
                        style: Styles.text18Inter.copyWith(
                            color: kBlackColorWithOpacity63, fontSize: 18),
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
