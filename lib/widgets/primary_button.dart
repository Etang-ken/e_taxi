import 'package:e_taxi/theme/app_colors.dart';
import 'package:e_taxi/theme/app_styles.dart';
import 'package:flutter/cupertino.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onClick;

  const PrimaryButton({required this.buttonText, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        decoration: BoxDecoration(
          color: AppColors.primaryBoldColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
            child: Text(
          buttonText,
          style: AppStyles.buttons.copyWith(
            color: AppColors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        )),
      ),
    );
  }
}
