import 'package:flutter/material.dart';

import '../../core/constants/contants.dart';
import '../../core/themes/theme_colors.dart';
import '../../core/themes/theme_text.dart';

class MyFaultCard extends StatelessWidget {
  const MyFaultCard(
      {Key? key,
      this.createdAt,
      this.description,
      this.updatedAt,
      this.status,
      this.faultType,
      required this.color,
      this.onUpdate})
      : super(key: key);
  final String? createdAt;
  final String? description;
  final String? updatedAt;
  final String? status, faultType;
  final String color;
  final Function()? onUpdate;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(9),
      margin: const EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        top: 15,
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
            'Fault Type',
            style: TextStyle(
              color: ThemeColors.blackColor1,
              fontWeight: JanguAskFontWeight.kBoldText,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            faultType ?? 'not specified',
            maxLines: 5,
            style: const TextStyle(
              color: ThemeColors.primaryGreyColor,
              fontSize: 17.0,
            ),
          ),
          const SizedBox(height: 15.0),
          const Text(
            'Description of Fault',
            style: TextStyle(
              color: ThemeColors.blackColor1,
              fontWeight: JanguAskFontWeight.kBoldText,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            description ?? 'not specified',
            maxLines: 5,
            style: const TextStyle(
              color: ThemeColors.primaryGreyColor,
              fontSize: 17.0,
            ),
          ),
          const SizedBox(height: 15.0),
          const Text(
            "Created At",
            style: TextStyle(
              color: ThemeColors.blackColor1,
              fontWeight: JanguAskFontWeight.kBoldText,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            createdAt ?? 'not specified',
            style: const TextStyle(
              color: ThemeColors.primaryGreyColor,
              fontSize: 17.0,
            ),
          ),
          const SizedBox(height: 15.0),
          const Text(
            'Updated At',
            style: TextStyle(
              color: ThemeColors.blackColor1,
              fontWeight: JanguAskFontWeight.kBoldText,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            updatedAt ?? 'not specified',
            maxLines: 4,
            style: const TextStyle(
              color: ThemeColors.primaryGreyColor,
              fontSize: 17.0,
            ),
          ),
          const SizedBox(height: 8.0),
          const Text(
            'Status',
            style: TextStyle(
              color: ThemeColors.blackColor1,
              fontWeight: JanguAskFontWeight.kBoldText,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 8.0),
          Container(
            color: getStyleColor(color),
            padding: const EdgeInsets.all(8),
            child: Text(
              status ?? 'not specified',
              style: const TextStyle(
                color: ThemeColors.whiteColor,
                fontSize: 17.0,
              ),
            ),
          ),
          Center(
            child: FlatButton(
              minWidth: MediaQuery.of(context).size.width * 0.400,
              onPressed: onUpdate!,
              child: const Text(
                'Update Status',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
