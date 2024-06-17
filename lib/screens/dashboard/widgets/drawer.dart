import 'dart:convert';

import 'package:e_taxi/helper/functions.dart';
import 'package:e_taxi/screens/dashboard/profile/settings.dart';
import 'package:e_taxi/theme/app_colors.dart';
import 'package:e_taxi/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  Map<String, dynamic> userData = {};

  Future<void> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final fetchedData = prefs.getString("userData");
    if (fetchedData != null) {
      setState(() {
        userData = jsonDecode(fetchedData);
      });
    } else {
      print("No user data found");
    }

  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height,
      height: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(90),
          bottomRight: Radius.circular(90),
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          children: [
                            Icon(Icons.chevron_left),
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
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/user-drawer-img.png",
                            width: 80,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            userData['name'] ?? '-',
                            style: AppStyles.smallHeader,
                          ),
                          Text(
                            userData['email'] ?? '-',
                            style: AppStyles.smallBodyText,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1,
                                  color: AppColors.grey.withOpacity(0.8)))),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person_outline,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Edit Profile",
                            style: AppStyles.smallBodyText,
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1,
                                  color: AppColors.grey.withOpacity(0.8)))),
                      child: Row(
                        children: [
                          Icon(
                            Icons.pin_drop_outlined,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Address",
                            style: AppStyles.smallBodyText,
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1,
                                  color: AppColors.grey.withOpacity(0.8)))),
                      child: Row(
                        children: [
                          Icon(
                            Icons.article_outlined,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "History",
                            style: AppStyles.smallBodyText,
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1,
                                  color: AppColors.grey.withOpacity(0.8)))),
                      child: Row(
                        children: [
                          Icon(
                            Icons.message_outlined,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Complain",
                            style: AppStyles.smallBodyText,
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1,
                                  color: AppColors.grey.withOpacity(0.8)))),
                      child: Row(
                        children: [
                          Icon(
                            Icons.people_outline,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Referral",
                            style: AppStyles.smallBodyText,
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1,
                                  color: AppColors.grey.withOpacity(0.8)))),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "About Us",
                            style: AppStyles.smallBodyText,
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingsScreen(),
                          ),
                        );
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1,
                                    color: AppColors.grey.withOpacity(0.8)))),
                        child: Row(
                          children: [
                            Icon(
                              Icons.settings_outlined,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Settings",
                              style: AppStyles.smallBodyText,
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1,
                                  color: AppColors.grey.withOpacity(0.8)))),
                      child: Row(
                        children: [
                          Icon(
                            Icons.help_outline,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Help and Support",
                            style: AppStyles.smallBodyText,
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await HelperFunctions.logOut(context);
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1,
                                    color: AppColors.grey.withOpacity(0.8)))),
                        child: Row(
                          children: [
                            Icon(
                              Icons.login_outlined,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Logout",
                              style: AppStyles.smallBodyText,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
