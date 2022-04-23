import 'package:flutter/material.dart';
import 'package:jedmgr/core/themes/theme_colors.dart';

import '../themes/theme_text.dart';

class PostLabel extends StatelessWidget {
  const PostLabel({
    Key? key,
    this.label,
  }) : super(key: key);
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label!,
      style: const TextStyle(
        color: ThemeColors.primaryGreyColor,
        fontSize: 13.0,
        fontWeight: JanguAskFontWeight.kBoldText,
      ),
    );
  }
}
