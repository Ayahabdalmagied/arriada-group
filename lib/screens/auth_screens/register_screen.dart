import 'package:arriada_group/screens/auth_screens/login_screen.dart';
import 'package:arriada_group/widgets/main_button_widgets.dart';
import 'package:arriada_group/widgets/text_field_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> registerForm = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  Future Register() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: phoneController.text.trim(),
          password: passwordController.text.trim());
      Navigator.of(context).pushNamed("LoginScreen");
    }
  }

  bool passwordConfirmed() {
    if (passwordController.text.trim() == confirmController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  void toLogin() {
    Navigator.of(context).pushReplacementNamed("LoginScreen");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 400,
                  height: 300,
                  child: Image.asset("assets/arriada.png"),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Form(
              child: Column(
                children: [
                  TextFieldWidget(
                    controller: nameController,
                    hintText: "enter your name",
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your Name ";
                      }

                      return null;
                    },
                  ),
                  TextFieldWidget(
                    controller: emailController,
                    hintText: "example@gmail.com",
                    validator: (String? value) {
                      //check why there's two !'s
                      if (!value!.contains("@") &&
                          !value.contains(".com") &&
                          value.isNotEmpty) {
                        return "Please a valid mail";
                      }

                      return null;
                    },
                  ),
                  TextFieldWidget(
                    controller: phoneController,
                    hintText: "91-XXXXXXX",
                    validator: (value) {
                      if (value!.isEmpty && value.length != 9) {
                        return "please enter a valid phone number";
                      }

                      return null;
                    },
                  ),
                  TextFieldWidget(
                    controller: passwordController,
                    hintText: "********",
                    validator: (value) {
                      if (value!.isEmpty && value.length < 8) {
                        return "enter password";
                      }

                      return null;
                    },
                  ),
                  TextFieldWidget(
                    controller: confirmController,
                    hintText: "********",
                    validator: (value) {
                      if (value!.isEmpty && value.length < 8) {
                        return "enter correct password";
                      }

                      return null;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: Register,
              child: MainButton(
                  text: 'Create account',
                  withBorder: false,
                  onPressed: () {
                    if (registerForm.currentState!.validate()) {
                      // print('success');
                    } else {
                      // print('Not');
                    }
                  }),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: toLogin,
              child: MainButton(
                text: "Already have an account? Sign in Now",
                withBorder: true,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
