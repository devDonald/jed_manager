import 'package:flutter/material.dart';

import '../themes/theme_colors.dart';
import '../themes/theme_text.dart';

class JedText extends StatelessWidget {
  const JedText({
    Key? key,
    this.fontSize,
  }) : super(key: key);
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        text: TextSpan(
          text: 'Jed',
          style: TextStyle(
            color: ThemeColors.primaryGreyColor,
            fontSize: (fontSize != null) ? fontSize : 15,
            fontFamily: JedFontFamily.secondaryFontMonserat,
            fontWeight: FontWeight.bold,
          ),
          children: <TextSpan>[
            TextSpan(
              text: 'MGR',
              style: TextStyle(
                color: ThemeColors.primaryColor,
                fontSize: (fontSize != null) ? fontSize : 15,
                fontFamily: JedFontFamily.secondaryFontMonserat,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
