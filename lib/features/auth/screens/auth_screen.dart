import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_textfield.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  static const String routeName = '/auth-screen';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final AuthService authService = AuthService();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void signUpUser() {
    authService.signUpUser(email: _emailController.text, password: _passwordController.text, name: _nameController.text, context: context);
  }

  void signInUser() {
    authService.signInUser(email: _emailController.text, password: _passwordController.text, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundColor,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Column(
                children: [
                  ListTile(
                    tileColor: _auth == Auth.signup
                        ? GlobalVariables.backgroundColor
                        : GlobalVariables.greyBackgroundColor,
                    title: const Text(
                      "Create Account",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: Radio(
                      activeColor: GlobalVariables.secondaryColor,
                      value: Auth.signup,
                      groupValue: _auth,
                      onChanged: (Auth? val) {
                        setState(() {
                          _auth = val!;
                        });
                      },
                    ),
                  ),
                  if (_auth == Auth.signup)
                    Container(
                      decoration: BoxDecoration(
                        color: GlobalVariables.backgroundColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.all(5),
                      
                      child: Form(
                        key: _signUpFormKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: _nameController,
                              hintText: "Name",
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              controller: _emailController,
                              hintText: "Email",
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              controller: _passwordController,
                              hintText: "Password",
                            ),
                            const SizedBox(height: 10),
                            CustomButton(
                              text: 'Sign Up',
                              onTap: () {
                                if (_signUpFormKey.currentState!.validate()) {
                                  signUpUser();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ListTile(
                    tileColor: _auth == Auth.signin
                        ? GlobalVariables.backgroundColor
                        : GlobalVariables.greyBackgroundColor,
                    title: const Text(
                      "Sign In",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: Radio(
                      activeColor: GlobalVariables.secondaryColor,
                      value: Auth.signin,
                      groupValue: _auth,
                      onChanged: (Auth? val) {
                        setState(() {
                          _auth = val!;
                        });
                      },
                    ),
                  ),
                  if (_auth == Auth.signin)
                    Container(
                      decoration: BoxDecoration(
                        color: GlobalVariables.backgroundColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.all(5),
                      child: Form(
                        key: _signInFormKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: _emailController,
                              hintText: "Email",
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              controller: _passwordController,
                              hintText: "Password",
                            ),
                            const SizedBox(height: 10),
                            CustomButton(
                              text: 'Sign In',
                              onTap: () {
                                if (_signInFormKey.currentState!.validate()) {
                                  signInUser();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
