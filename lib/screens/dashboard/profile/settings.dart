import 'package:e_taxi/screens/dashboard/profile/change_password.dart';
import 'package:e_taxi/theme/app_colors.dart';
import 'package:e_taxi/theme/app_styles.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
                          "Settings",
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
                _settingContainer(
                    name: "Change Password",
                    onClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangePasswordScreen(),
                        ),
                      );
                    }),
                _settingContainer(name: "Change Language"),
                _settingContainer(name: "Privacy Policy"),
                _settingContainer(name: "Contact Us"),
                _settingContainer(name: "Delete Account")
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _settingContainer({required String name, VoidCallback? onClick}) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.primaryBoldColor.withOpacity(0.6),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                name,
                style: AppStyles.bodyText,
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
