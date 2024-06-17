import 'package:e_taxi/helper/functions.dart';
import 'package:e_taxi/helper/helper/http_reqs.dart';
import 'package:e_taxi/helper/widgets.dart';
import 'package:e_taxi/screens/auth/sign_in.dart';
import 'package:e_taxi/theme/app_colors.dart';
import 'package:e_taxi/theme/app_styles.dart';
import 'package:e_taxi/widgets/customDropDownMenu.dart';
import 'package:e_taxi/widgets/customPhoneInputField.dart';
import 'package:e_taxi/widgets/primary_button.dart';
import 'package:e_taxi/widgets/text_input.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool hidePassword = true;
  bool hideConfirmPassword = true;
  bool agreeTerms = false;
  bool isLoading = false;
  final Map<String, String> formData = {
    "name": "",
    "email": "",
    "phone_number": "",
    "password": "",
    "confirmPassword": "",
    "gender": ""
  };

  Future<void> signUp() async {
    setState(() {
      isLoading = true;
    });
    final response =
        await API().postRequest(route: "/register", data: formData);
    print(response.statusCode);
    if (response.statusCode == 201) {
      showAppSnackBar(
        context: context,
        message: "Registration Successful.",
        type: SnackBarType.success,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SignInScreen(),
        ),
      );
    } else if (response.statusCode == 409) {
      showAppSnackBar(
        context: context,
        message: "A user with this email already exist.",
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
                        "Sign Up",
                        style: AppStyles.header,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        placeholder: "Name*",
                        onChange: (val) {
                          setState(() {
                            formData['name'] = val!;
                          });
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'The Name field is required';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        placeholder: "Email*",
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
                      CustomPhoneInputField(
                        onChange: (val) {
                          setState(() {
                            formData['phone_number'] = val ?? '';
                          });
                        },
                        placeholder: "Your mobile number",
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'The Phone number field is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // CustomDropDownMenu(
                      //   hintText: "Gender",
                      //   elements: <Map<String, dynamic>>[
                      //     {"name": "Male"},
                      //     {"name": "Female"},
                      //     {"name": "Other"}
                      //   ],
                      //   onChange: (val) {
                      //     // setState(() {
                      //     //   formData['gender'] = val['name'] ?? '';
                      //     // });
                      //     print("Value: ${val}");
                      //   },
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      Stack(
                        children: [
                          CustomTextField(
                            placeholder: "Password*",
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
                        height: 20,
                      ),
                      Stack(
                        children: [
                          CustomTextField(
                            placeholder: "Confirm Password*",
                            obscureText: hideConfirmPassword,
                            onChange: (val) {
                              setState(() {
                                formData['confirmPassword'] = val ?? '';
                              });
                            },
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'The Confirm password field is required';
                              }
                              if (formData['password'] != val) {
                                return "passwords do not match";
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
                        height: 20,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: agreeTerms,
                            activeColor: AppColors.greenColor,
                            onChanged: (val) {
                              setState(() {
                                agreeTerms = val!;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "By signing up, you agree to the ",
                                    style: AppStyles.smallBodyText.copyWith(
                                      color:
                                          AppColors.mediumGrey.withOpacity(0.8),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Terms of service ",
                                    style: AppStyles.smallBodyText.copyWith(
                                      color: AppColors.primaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "and ",
                                    style: AppStyles.smallBodyText.copyWith(
                                      color:
                                          AppColors.mediumGrey.withOpacity(0.8),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "privacy policy ",
                                    style: AppStyles.smallBodyText.copyWith(
                                      color: AppColors.primaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      PrimaryButton(
                        buttonText: "Sign Up",
                        onClick: () async {
                          if (_formKey.currentState!.validate()) {
                            await signUp();
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
                            "Already have an account?",
                            style: AppStyles.smallHeader.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const SignInScreen(),
                                ), // Navigate to your dashboard screen
                              );
                            },
                            child: Text(
                              " Sign In",
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
