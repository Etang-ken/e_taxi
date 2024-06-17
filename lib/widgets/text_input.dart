import 'package:e_taxi/theme/app_colors.dart';
import 'package:e_taxi/theme/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? placeholder;
  final Widget? sideIcon;
  final void Function(String?)? onChange;
  final String? Function(String?)? validator;
  final bool obscureText;

  CustomTextField(
      {this.controller,
      this.placeholder,
      this.sideIcon,
      this.onChange,
      this.validator,
      this.obscureText = false});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
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
        children: [
          widget.sideIcon ??
              const SizedBox(
                height: 0,
              ),
          SizedBox(
            width: widget.sideIcon != null ? 25 : 0,
          ),
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              validator: widget.validator,
              obscureText: widget.obscureText,
              onChanged: widget.onChange,
              decoration: InputDecoration(
                fillColor: Colors.transparent,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                hintText: widget.placeholder,
                hintStyle: AppStyles.bodyText.copyWith(
                  color: AppColors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
