import 'package:auto_route/annotations.dart';
import 'package:book_hive/core/utilities/ui_extension.dart';
import 'package:book_hive/core/widgets/app_button_widget.dart';
import 'package:book_hive/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

@RoutePage(name: 'SignIn')
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              20.verticalBox,
              Text('Create an account'),
              10.verticalBox,
              AppTextField.textField(
                context: context,
                name: 'firstName',
                hint: 'First name',
                borderRadius: 10,
              ).py(5),
              AppTextField.textField(
                context: context,
                name: 'lastName',
                hint: 'Last name',
                borderRadius: 10,
              ).py(5),
              AppTextField.textField(
                context: context,
                name: 'email',
                hint: 'Email',
                borderRadius: 10,
              ).py(5),
              AppTextField.textField(
                context: context,
                name: 'password',
                hint: 'Password',
                borderRadius: 10,
              ).py(5),
              10.verticalBox,
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black, // Ensure text is visible
                    fontSize: 14.0, // Adjust as needed
                  ),
                  children: [
                    TextSpan(
                      text:
                          'By continuing, you agree to the Terms of use Read our ',
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color:
                            Colors.blue, // Example: Make it a link-like color
                      ),
                    ),
                  ],
                ),
              ),
              20.verticalBox,
              AppButton(title: 'Continue', onClick: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
