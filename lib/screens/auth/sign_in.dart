import 'dart:convert';

import 'package:e_taxi/helper/functions.dart';
import 'package:e_taxi/helper/helper/http_reqs.dart';
import 'package:e_taxi/helper/widgets.dart';
import 'package:e_taxi/screens/auth/sign_up.dart';
import 'package:e_taxi/screens/nav/dashboard_nav.dart';
import 'package:e_taxi/theme/app_colors.dart';
import 'package:e_taxi/theme/app_styles.dart';
import 'package:e_taxi/widgets/customDropDownMenu.dart';
import 'package:e_taxi/widgets/customPhoneInputField.dart';
import 'package:e_taxi/widgets/primary_button.dart';
import 'package:e_taxi/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final storage = FlutterSecureStorage();
  bool hidePassword = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final Map<String, String> formData = {
    "email": "",
    "password": "",
  };

  Future<void> signIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isLoading = true;
    });
    final response = await API().postRequest(route: "/login", data: formData);
    final decodedData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      storage.write(key: "authToken", value: (decodedData['token']));
      prefs.setString("userData", jsonEncode(decodedData['user']));
      showAppSnackBar(
        context: context,
        message: "Login Successful.",
        type: SnackBarType.success,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const DashboardNav(),
        ),
      );
    } else if (response.statusCode == 401) {
      showAppSnackBar(
        context: context,
        message: "Invalid user credentials.",
        type: SnackBarType.failure,
      );
    } else {
      print("Error");
      showAppSnackBar(
        context: context,
        message: "Network Error. Please try again.",
        type: SnackBarType.failure,
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
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
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Sign In",
                        style: AppStyles.header,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        placeholder: "Email in Phone Number",
                        onChange: (val) {
                          setState(() {
                            formData['email'] = val ?? '';
                          });
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'The Email field is required';
                          }
                          if (!HelperFunctions.isValidEmail(val)) {
                            return 'Please enter a valid email.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Stack(
                        children: [
                          CustomTextField(
                            placeholder: "Enter Your Password",
                            obscureText: hidePassword,
                            onChange: (val) {
                              setState(() {
                                formData['password'] = val ?? '';
                              });
                            },
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'The Password field is required';
                              }
                              return null;
                            },
                          ),
                          Positioned(
                            right: 10,
                            top: 20,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              child: Icon(
                                hidePassword
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: AppColors.mediumGrey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ), // Navigate to your dashboard screen
                            );
                          },
                          child: Text(
                            "Forgot password?",
                            style: AppStyles.bodyText.copyWith(
                              color: AppColors.redColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      PrimaryButton(
                        buttonText: "Sign In",
                        onClick: () async {
                          if (_formKey.currentState!.validate()) {
                            await signIn();
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              height: 1.5,
                              color: AppColors.mediumGrey,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            child: Text(
                              "or",
                              style: AppStyles.smallHeader.copyWith(
                                color: AppColors.mediumGrey,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              height: 1.5,
                              color: AppColors.mediumGrey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/gmail.png",
                            width: 50,
                          ),
                          const SizedBox(
                            width: 14,
                          ),
                          Image.asset(
                            "assets/icons/facebook.png",
                            width: 50,
                          ),
                          const SizedBox(
                            width: 14,
                          ),
                          Image.asset(
                            "assets/icons/apple.png",
                            width: 50,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: AppStyles.smallHeader.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const SignUpScreen(),
                                ), // Navigate to your dashboard screen
                              );
                            },
                            child: Text(
                              " Sign Up",
                              style: AppStyles.smallHeader.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryBoldColor,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        if (isLoading) showIsLoading()
      ],
    );
  }
}
