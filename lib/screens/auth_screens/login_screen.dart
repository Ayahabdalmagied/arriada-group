import 'package:arriada_group/widgets/main_button_widgets.dart';
import 'package:arriada_group/widgets/text_field_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future login() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: phoneController.text.trim(),
        password: passwordController.text.trim());
  }

  void toRegister() {
    Navigator.of(context).pushReplacementNamed("RegisterScreen");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 400,
                  height: 300,
                  child: Image.asset("assets/arriadalogo.png"),
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
                  controller: phoneController,
                  hintText: "91-xxx xx xx",
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    if (value.length != 9) {
                      return 'Please enter valid phone number';
                    }
                    return null;
                  },
                ),
                TextFieldWidget(
                    controller: passwordController,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password ';
                      }

                      if (value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }

                      return null;
                    },
                    hintText: "********"),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: login,
                  child: MainButton(
                      text: 'Login',
                      txtColor: Colors.white,
                      withBorder: false,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
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
                  onTap: toRegister,
                  child: MainButton(
                    text: "Don't have an account? Register Now",
                    txtColor: Colors.white,
                    withBorder: true,
                    onPressed: () {},
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
