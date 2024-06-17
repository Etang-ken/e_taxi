import 'package:e_taxi/theme/app_colors.dart';
import 'package:e_taxi/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class CustomPhoneInputField extends StatefulWidget {
  CustomPhoneInputField(
      {this.focusNode,
      required this.onChange,
      this.placeholder = '',
      this.suffixIcon,
      this.prefixIcon,
      this.isFilled = true,
      this.hasSuffix = false,
      this.contentPadding =
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      this.fillColor,
      this.hasBorder = false,
      this.borderColor = Colors.transparent,
      this.borderWidth = 2,
      this.hasPrefix = false,
      this.minLines = 1,
      this.maxLines = 1,
      this.initialValue,
      this.obscureText = false,
      this.keyboardType = TextInputType.text,
      // this.validator,
      this.hasValidation = false,
      this.isEnabled = true,
      this.prefixColor,
      this.controller,
      this.validator});

  final String? prefixIcon;
  final String? suffixIcon;
  final bool hasSuffix;
  final bool hasPrefix;
  final String? placeholder;
  final void Function(String) onChange;

  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final bool isFilled;
  final Color? fillColor;
  final EdgeInsets contentPadding;
  final bool hasBorder;
  final Color borderColor;
  final double borderWidth;
  final int? minLines;
  final int? maxLines;
  final String? initialValue;
  bool obscureText;
  final keyboardType;
  final hasValidation;
  final isEnabled;
  final Color? prefixColor;
  final TextEditingController? controller;

  @override
  State<CustomPhoneInputField> createState() => _CustomPhoneInputFieldState();
}

class _CustomPhoneInputFieldState extends State<CustomPhoneInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1,
          color: AppColors.mediumGrey,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                  right: BorderSide(
                width: 1,
                color: AppColors.mediumGrey,
              )),
            ),
            child: Image.asset(
              "assets/images/cam_flag.png",
              width: 35,
            ),
          ),
          Expanded(
            child: TextFormField(
              style: AppStyles.smallBodyText,
              onChanged: widget.onChange,
              focusNode: widget.focusNode,
              initialValue: widget.initialValue,
              obscureText: widget.obscureText,
              enabled: widget.isEnabled,
              controller: widget.controller,
              validator: widget.validator,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                hintText: widget.placeholder ?? '',
                hintStyle: AppStyles.bodyText.copyWith(
                  color: AppColors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
              ),
              keyboardType: widget.keyboardType,
            ),
          ),
        ],
      ),
    );
  }
}
