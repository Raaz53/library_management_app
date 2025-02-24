import 'package:auto_route/auto_route.dart';
import 'package:book_hive/core/app_theme/app_colors.dart';
import 'package:book_hive/core/injection/injection.dart';
import 'package:book_hive/core/models/user_model/user_model.dart';
import 'package:book_hive/core/routes/routes.dart';
import 'package:book_hive/core/utilities/app_text_styles.dart';
import 'package:book_hive/core/utilities/ui_extension.dart';
import 'package:book_hive/core/utilities/utilities.dart';
import 'package:book_hive/core/widgets/app_button_widget.dart';
import 'package:book_hive/core/widgets/app_text_field.dart';
import 'package:book_hive/features/login_screen/cubit/user_signin_cubit/user_signin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

final _formKey = GlobalKey<FormBuilderState>();

@RoutePage(name: 'SignIn')
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late UserSignInCubit _userSignInCubit;
  bool _isObscured = true;

  @override
  void initState() {
    super.initState();
    _userSignInCubit = Injector.instance<UserSignInCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: FormBuilder(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  20.verticalBox,
                  Text(
                    'Create an account',
                    style: AppTextStyles.headlineLargeMonserat.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.black),
                  ),
                  10.verticalBox,
                  AppTextField.textField(
                    context: context,
                    headerTitle: 'Full Name',
                    headerStyle: AppTextStyles.bodyMediumMonserat
                        .copyWith(color: AppColors.black),
                    isTextFieldOnly: false,
                    name: 'full_name',
                    hint: 'Enter your name',
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'Name is required'),
                    ]),
                    borderRadius: 10,
                  ).py(5),
                  AppTextField.textField(
                    context: context,
                    name: 'email',
                    headerStyle: AppTextStyles.bodyMediumMonserat
                        .copyWith(color: AppColors.black),
                    headerTitle: 'Email',
                    isTextFieldOnly: false,
                    textCapitalization: TextCapitalization.none,
                    hint: 'Enter your email',
                    keyboardType: TextInputType.emailAddress,
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
                    isObscured: _isObscured,
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscured = !_isObscured;
                          });
                        },
                        icon: Icon(_isObscured
                            ? Icons.visibility
                            : Icons.visibility_off)),
                    textCapitalization: TextCapitalization.none,
                    isTextFieldOnly: false,
                    hint: 'Enter your password',
                    borderRadius: 10,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'Password is required'),
                      FormBuilderValidators.minLength(6,
                          errorText:
                              'Password must be at least 6 characters long'),
                      FormBuilderValidators.notEqual('password123',
                          errorText:
                              'Password must not be the same as "password123"'),
                    ]),
                  ).py(5),
                  AppTextField.textField(
                    context: context,
                    name: 'bio',
                    headerTitle: 'Bio',
                    headerStyle: AppTextStyles.bodyMediumMonserat
                        .copyWith(color: AppColors.black),
                    isTextFieldOnly: false,
                    hint: 'Say something about yourself',
                    borderRadius: 10,
                    maxLines: 4,
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
                            color: Colors
                                .blue, // Example: Make it a link-like color
                          ),
                        ),
                      ],
                    ),
                  ),
                  20.verticalBox,
                  BlocListener<UserSignInCubit, UserSignInState>(
                    bloc: _userSignInCubit,
                    listener: (context, state) {
                      state.maybeWhen(
                        orElse: () {},
                        loading: () {
                          Utilities.showCustomDialog(
                            context: context,
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const CircularProgressIndicator.adaptive(),
                                  const SizedBox(height: 16),
                                  Text(
                                    "Please wait...",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        registerSuccess: (_) {
                          context.router.push(Dashboard());
                        },
                        error: (message) {
                          Utilities.showCustomSnackbar(
                              context: context, message: message);
                        },
                      );
                    },
                    child: AppButton(
                      title: 'Continue',
                      onClick: () {
                        if (_formKey.currentState!.saveAndValidate()) {
                          if (_formKey.currentState!.value['password'] ==
                                  null ||
                              _formKey.currentState!.value['password'] == '') {
                            Utilities.showCustomSnackbar(
                                context: context,
                                message: 'Password is required');
                            return;
                          }
                          UserModel userModel = UserModel(
                            name: _formKey.currentState!.value['full_name'],
                            email: _formKey.currentState!.value['email'],
                            bio: _formKey.currentState!.value['bio'],
                            role: 'user',
                          );
                          String password =
                              _formKey.currentState!.value['password'];

                          _userSignInCubit.registerUser(
                              userModel: userModel, password: password);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
