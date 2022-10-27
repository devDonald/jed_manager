import 'package:flutter/material.dart';

import '../../core/themes/theme_colors.dart';
import '../../core/themes/theme_text.dart';

class MyLogCard extends StatelessWidget {
  const MyLogCard({
    Key? key,
    this.activity,
    this.time,
    this.location,
    this.date,
  }) : super(key: key);
  final String? activity;
  final String? time;
  final String? location, date;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(
        left: 5.0,
        right: 5.0,
        top: 10,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: ThemeColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            blurRadius: 8.0,
            offset: Offset(
              0.0,
              4.0,
            ),
            color: ThemeColors.shadowColor,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Activity',
            style: TextStyle(
              color: ThemeColors.blackColor1,
              fontWeight: JanguAskFontWeight.kBoldText,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            activity ?? 'not specified',
            maxLines: 5,
            style: const TextStyle(
              color: ThemeColors.primaryGreyColor,
              fontSize: 17.0,
            ),
          ),
          const SizedBox(height: 15.0),
          const Text(
            'Location',
            maxLines: 5,
            style: TextStyle(
              color: ThemeColors.blackColor1,
              fontWeight: JanguAskFontWeight.kBoldText,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            location ?? 'not specified',
            maxLines: 5,
            style: const TextStyle(
              color: ThemeColors.primaryGreyColor,
              fontSize: 17.0,
            ),
          ),
          const SizedBox(height: 15.0),
          const Text(
            "Activity Date",
            style: TextStyle(
              color: ThemeColors.blackColor1,
              fontWeight: JanguAskFontWeight.kBoldText,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            date ?? 'not specified',
            style: const TextStyle(
              color: ThemeColors.primaryGreyColor,
              fontSize: 17.0,
            ),
          ),
          const SizedBox(height: 15.0),
          const Text(
            'Activity Time',
            style: TextStyle(
              color: ThemeColors.blackColor1,
              fontWeight: JanguAskFontWeight.kBoldText,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            time ?? 'not specified',
            maxLines: 4,
            style: const TextStyle(
              color: ThemeColors.primaryGreyColor,
              fontSize: 17.0,
            ),
          ),
        ],
      ),
    );
  }
}
