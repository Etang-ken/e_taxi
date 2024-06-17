import 'package:e_taxi/theme/app_colors.dart';
import 'package:e_taxi/theme/app_styles.dart';
import 'package:flutter/cupertino.dart';

class SecondaryButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onClick;
  final double verticalPadding;

  const SecondaryButton(
      {required this.buttonText,
      required this.onClick,
      this.verticalPadding = 18});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: double.infinity,
        padding:
            EdgeInsets.symmetric(vertical: verticalPadding, horizontal: 20),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: AppColors.primaryBoldColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
            child: Text(
          buttonText,
          style: AppStyles.buttons.copyWith(
            color: AppColors.primaryBoldColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        )),
      ),
    );
  }
}
