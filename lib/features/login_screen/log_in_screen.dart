import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:book_hive/core/app_theme/app_colors.dart';
import 'package:book_hive/core/injection/injection.dart';
import 'package:book_hive/core/routes/routes.dart';
import 'package:book_hive/core/utilities/app_text_styles.dart';
import 'package:book_hive/core/utilities/ui_extension.dart';
import 'package:book_hive/core/utilities/utilities.dart';
import 'package:book_hive/core/widgets/app_button_widget.dart';
import 'package:book_hive/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'cubit/user_signin_cubit/user_signin_cubit.dart';

final _formKey = GlobalKey<FormBuilderState>();

@RoutePage(name: 'LogIn')
class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  late UserSignInCubit _userSignInCubit;

  @override
  void initState() {
    super.initState();
    _userSignInCubit = Injector.instance<UserSignInCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              100.verticalBox,
              Text(
                'Welcome to BookHive',
                style: AppTextStyles.headlineLargeMonserat.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.black),
              ),
              Text('Please login or register',
                  style: AppTextStyles.headlineLargeMonserat
                      .copyWith(fontSize: 24, color: Colors.black)),
              20.verticalBox,
              AppTextField.textField(
                context: context,
                name: 'email',
                headerStyle: AppTextStyles.bodyMediumMonserat
                    .copyWith(color: AppColors.black),
                headerTitle: 'Email',
                isTextFieldOnly: false,
                hint: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.none,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: 'Email is required'),
                  FormBuilderValidators.email(
                      errorText: 'Invalid email address'),
                ]),
                borderRadius: 10,
              ).py(5),
              AppTextField.textField(
                context: context,
                name: 'password',
                headerStyle: AppTextStyles.bodyMediumMonserat
                    .copyWith(color: AppColors.black),
                headerTitle: 'Password',
                isTextFieldOnly: false,
                hint: 'Enter your password',
                borderRadius: 10,
                validator: FormBuilderValidators.compose([]),
              ).py(5),
              10.verticalBox,
              BlocListener<UserSignInCubit, UserSignInState>(
                bloc: _userSignInCubit,
                listener: (context, state) {
                  state.maybeWhen(
                    error: (message) {
                      Navigator.pop(context);
                      log('Error is being called');
                      Utilities.showSnackBar(context, 'Error');
                    },
                    loading: () {
                      Utilities.showCustomDialog(
                        context: context,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                    loginSuccess: (_) {
                      _formKey.currentState?.reset();

                      Navigator.pop(context);
                      context.router.replaceAll([Dashboard()]);
                    },
                    orElse: () {},
                  );
                },
                child: AppButton(
                  title: 'Log In',
                  onClick: () {
                    if (_formKey.currentState!.saveAndValidate()) {
                      final email = _formKey
                          .currentState!.fields['email']!.value
                          .toString();
                      final password = _formKey
                          .currentState!.fields['password']!.value
                          .toString();
                      _userSignInCubit.loginUser(
                          email: email, password: password);
                    }
                  },
                ),
              ),
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
                    onPressed: () {
                      context.router.push(SignIn());
                    },
                    child: Text('Register now'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
