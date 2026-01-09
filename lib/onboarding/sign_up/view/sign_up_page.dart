import 'package:chat_app_3/app/utils/validators.dart';
import 'package:chat_app_3/onboarding/sign_up/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final signUpCubit = context.read<SignUpCubit>();

    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.showErrorMessage) {
          Fluttertoast.showToast(
            msg: state.message ?? '',
            toastLength: Toast.LENGTH_LONG,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Stack(
              children: [
                Form(
                  key: formKey,
                  child: ListView(
                    children: [
                      const SizedBox(height: 20),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Sign up with ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: 'Email',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: Color(
                                  0xFF58C3B6,
                                ).withValues(alpha: 0.7),
                                decorationThickness: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(40),
                        child: Text(
                          'Get chatting with friends and family today by signing up for our chat app!',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF797C7B),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 20),

                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(labelText: 'Your name'),
                        onChanged: signUpCubit.onNameChanged,
                        // TODO: agregar validación para el nombre
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(labelText: 'Your email'),
                        validator: Validators.validateEmail,
                        onChanged: signUpCubit.onEmailChanged,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(labelText: 'Password'),
                        onChanged: signUpCubit.onPasswordChanged,
                        validator: (value) {
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      BlocBuilder<SignUpCubit, SignUpState>(
                        buildWhen: (previous, current) =>
                            previous.status != current.status,
                        builder: (context, state) {
                          return TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                            ),
                            validator: Validators.validatePassword,
                            onChanged: signUpCubit.onConfirmPasswordChanged,
                            forceErrorText:
                                state.password != state.confirmPassword
                                ? 'Passwords do not match'
                                : null,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentGeometry.bottomCenter,
                  child: Container(
                    color: Colors.white,
                    width: double.infinity,
                    child: BlocBuilder<SignUpCubit, SignUpState>(
                      builder: (context, state) {
                        // if (state.status == Status.loading) {
                        //   return CircularProgressIndicator.adaptive();
                        // }
                        return ElevatedButton(
                          onPressed: (state.status == Status.loading)
                              ? null
                              : () {
                                  final isValid = formKey.currentState
                                      ?.validate();
                                  if (isValid ?? false) {
                                    signUpCubit.signUp();
                                  } else {
                                    print('Formulario no válido');
                                  }
                                },
                          child: Text('Create an account'),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
