import 'package:e_taxi/theme/app_colors.dart';
import 'package:e_taxi/theme/app_styles.dart';
import 'package:e_taxi/widgets/primary_button.dart';
import 'package:e_taxi/widgets/text_input.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool hideOldPassword = true;
  bool hideNewPassword = true;
  bool hideConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Row(
                        children: [
                          const Icon(Icons.chevron_left),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Back",
                            style: AppStyles.bodyText.copyWith(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Change Password",
                          style: AppStyles.smallHeader.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Stack(
                  children: [
                    CustomTextField(
                      placeholder: "Old Password",
                      obscureText: hideOldPassword,
                    ),
                    Positioned(
                      right: 10,
                      top: 20,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            hideOldPassword = !hideOldPassword;
                          });
                        },
                        child: Icon(
                          hideOldPassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: AppColors.mediumGrey,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    CustomTextField(
                      placeholder: "Confirm Password",
                      obscureText: hideNewPassword,
                    ),
                    Positioned(
                      right: 10,
                      top: 20,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            hideNewPassword = !hideNewPassword;
                          });
                        },
                        child: Icon(
                          hideNewPassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: AppColors.mediumGrey,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    CustomTextField(
                      placeholder: "Confirm Password",
                      obscureText: hideConfirmPassword,
                    ),
                    Positioned(
                      right: 10,
                      top: 20,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            hideConfirmPassword = !hideConfirmPassword;
                          });
                        },
                        child: Icon(
                          hideConfirmPassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: AppColors.mediumGrey,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                PrimaryButton(buttonText: "Save", onClick: () {

                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
