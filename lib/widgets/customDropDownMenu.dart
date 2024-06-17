import 'package:e_taxi/theme/app_colors.dart';
import 'package:e_taxi/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CustomDropDownMenu extends StatelessWidget {
  const CustomDropDownMenu(
      {super.key,
      this.style = const TextStyle(color: Colors.black),
      required this.elements,
      required this.onChange,
      this.hasBorder = false,
      this.isFilled = true,
      this.fillColor,
      this.contentPadding =
          const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      this.selectedItem,
      this.hintText,
      this.borderColor = const Color(0xFF152256),
      this.validator,
      this.readOnly = false});

  final TextStyle style;
  final List<dynamic> elements;
  final void Function(dynamic) onChange;
  final hasBorder;
  final bool isFilled;
  final fillColor;
  final contentPadding;
  final selectedItem;
  final hintText;
  final borderColor;
  final String? Function(Object?)? validator;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: readOnly
            ? Colors.grey.withOpacity(0.3)
            : AppColors.white.withOpacity(0.7),
        border: Border.all(
          color: AppColors.mediumGrey,
          width: 1,
        ),
      ),
      child: DropdownButtonFormField(
          style: AppStyles.smallBodyText,
          isExpanded: true,
          value: selectedItem,
          items: _getItems(),
          validator: validator,
          dropdownColor: AppColors.white,
          decoration: InputDecoration(
            hintText: hintText,
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
            contentPadding: contentPadding,
          ),
          onChanged: onChange),
    );
  }

  _getItems() {
    return elements.map<DropdownMenuItem<Map<String, dynamic>>>((item) {
      return DropdownMenuItem<Map<String, dynamic>>(
        value: item,
        child: Container(
          child: Text(
            item['name'].toString(),
            softWrap: true,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    }).toList();
  }
}
