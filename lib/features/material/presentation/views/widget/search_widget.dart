import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/text_styles.dart';

class SearchWidget extends StatelessWidget {
  final void Function(String)? onChanged;
  const SearchWidget({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kSoundColor,
      style: Styles.text18Inter.copyWith(
        color: kBlackColorWithOpacity63,
        fontSize: 16,
      ),
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12),
        hintText: 'Search..',
        hintStyle: Styles.text18Inter.copyWith(
          color: kBlackColorWithOpacity63,
          fontSize: 16,
        ),
        fillColor: kDividerColor,
        filled: true,
        enabledBorder: borderMethod(),
        focusedBorder: borderMethod(),
        prefixIcon: const Icon(
          FontAwesomeIcons.magnifyingGlass,
          color: kSoundColor,
          size: 20,
        ),
      ),
    );
  }

  OutlineInputBorder borderMethod() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
    );
  }
}
