import 'package:articulate/constant.dart';
import 'package:articulate/core/utils/assets.dart';
import 'package:articulate/core/utils/common/functions.dart';
import 'package:articulate/core/utils/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserImageWidget extends StatelessWidget {
  final String url;
  final bool isLoading;

  const UserImageWidget({
    required this.url,
    Key? key,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height / 4.8,
      left: MediaQuery.of(context).size.width / 2 - 60.r,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            radius: 62.r,
            backgroundColor: kBlueColor3,
            child: CircleAvatar(
              radius: 59.r,
              child: isLoading
                  ? const CustomCircularProgressIndicator(color: kBlueColor3)
                  : CircleAvatar(
                      radius: 59.r,
                      backgroundColor: kWhiteColor,
                      backgroundImage: NetworkImage(url.isEmpty
                          ? 'https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png'
                          : 'https://youssifallam.pythonanywhere.com$url'),
                    ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 7.8,
            left: MediaQuery.of(context).size.width / 3.6,
            child: GestureDetector(
              onTap: () => Functions.pickImage(),
              child: Image.asset(AssetData.getImage, scale: 0.7),
            ),
          ),
        ],
      ),
    );
  }
}
