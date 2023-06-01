import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:riverpod_todo_app/constants/app_style.dart';

class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget({
    required this.titleText,
    required this.valueText,
    required this.iconSection,
    super.key,
  });

  final String titleText;
  final String valueText;
  final IconData iconSection;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleText,
            style: AppStyle.headingOne,
          ),
          const Gap(6),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(iconSection),
                const Gap(12),
                Text(valueText),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
