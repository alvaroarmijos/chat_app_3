import 'package:chat_app_3/app/utils/validators.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
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
                      // TODO: agregar validación para el nombre
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(labelText: 'Your email'),
                      validator: Validators.validateEmail,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(labelText: 'Password'),
                      validator: (value) {
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                      ),
                      validator: Validators.validatePassword,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentGeometry.bottomCenter,
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final isValid = formKey.currentState?.validate();
                      if (isValid ?? false) {
                        print('Formulario válido');
                      } else {
                        print('Formulario inválido');
                      }
                    },
                    child: Text('Create an account'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
