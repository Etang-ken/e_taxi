import 'package:e_taxi/theme/app_colors.dart';
import 'package:e_taxi/theme/app_styles.dart';
import 'package:flutter/material.dart';

enum SnackBarType { success, failure, warning }

Widget showIsLoading() {
  return Positioned.fill(
    child: Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.3),
      ),
      child: Center(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(10),
          child: const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
          ),
        ),
      ),
    ),
  );
}

void showAppSnackBar(
    {required BuildContext context,
    required String message,
    required SnackBarType type}) {
  IconData iconData;
  Color iconColor;

  switch (type) {
    case SnackBarType.success:
      iconData = Icons.check_circle;
      iconColor = AppColors.greenColor;
      break;
    case SnackBarType.failure:
      iconData = Icons.cancel;
      iconColor = AppColors.redColor;
      break;
    case SnackBarType.warning:
      iconData = Icons.info;
      iconColor = AppColors.yellowColor;
      break;
  }
  final snackBar = SnackBar(
    backgroundColor: Colors.transparent,
    content: GestureDetector(
      onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(minHeight: 60),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: AppColors.deepTill,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          children: [
            Icon(
              iconData,
              color: iconColor,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Text(
              message,
              softWrap: true,
              style: AppStyles.bodyText.copyWith(
                color: AppColors.darkColor,
              ),
            )),
          ],
        ),
      ),
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
