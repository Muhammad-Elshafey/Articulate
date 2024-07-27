import 'package:articulate/core/utils/assets.dart';
import 'package:flutter/material.dart';

class MicLogoImage extends StatelessWidget {
  const MicLogoImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetData.splashImage,
    );
  }
}
