import 'package:auto_route/auto_route.dart';
import 'package:book_hive/core/routes/routes.dart';
import 'package:book_hive/core/utilities/ui_extension.dart';
import 'package:book_hive/core/widgets/app_button_widget.dart';
import 'package:book_hive/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

@RoutePage(name: 'LogIn')
class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            100.verticalBox,
            Text('Welcome to BookHive'),
            Text('Please login or register'),
            20.verticalBox,
            AppTextField.textField(
              context: context,
              name: 'email',
              hint: 'Email',
              backgroundColor: Colors.black87,
              borderRadius: 10,
            ),
            10.verticalBox,
            AppTextField.textField(
              context: context,
              name: 'password',
              hint: 'Password',
              backgroundColor: Colors.black87,
              borderRadius: 10,
            ),
            10.verticalBox,
            AppButton(title: 'Log In', onClick: () {}),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: ButtonStyle(splashFactory: NoSplash.splashFactory),
                  onPressed: () {},
                  child: Text('Forgot your password?'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                TextButton(
                  style: ButtonStyle(splashFactory: NoSplash.splashFactory),
                  onPressed: () => context.router.push(SignIn()),
                  child: Text('Register now'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
