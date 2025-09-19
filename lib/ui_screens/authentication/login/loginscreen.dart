import 'package:contractor_app/custom_Widgets/customButton.dart';
import 'package:contractor_app/custom_Widgets/customPasswordField.dart';
import 'package:contractor_app/custom_Widgets/customTextField.dart';
import 'package:contractor_app/ui_screens/authentication/phoneNumber/phoneNumberScreen.dart';
import 'package:contractor_app/ui_screens/authentication/sign_up/sing_up.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Image.asset(
                  'assets/images/mmprecise.png',
                  height: 100,
                ), // Replace with your logo
                SizedBox(height: 20),
                Text(
                  'Log In for exclusive designs, deals & quick checkout.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),

                CustomTextField(
                  controller: phoneController,
                  hintText: 'Phone Number',
                  keyboardType: TextInputType.phone,
                ),

                CustomPasswordField(
                  controller: passwordController,
                  hintText: 'Enter Password',
                ),

                SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> PhoneNumberScreen()));
                    },
                    child: const Text(
                      'Forget Password?',
                      style: TextStyle(
                        color: Colors.black87,
                        
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                CustomButton(
                  text: 'LOGIN',
                  onPressed: () {
                    // Handle sign-up
                  },
                ),

                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SignUpScreen()),
                    );
                  },
                  child: Text.rich(
                    TextSpan(
                      text: 'Don’t have an account? ',style: TextStyle(color: Color.fromARGB(255, 56, 56, 56)),
                      children: [
                        TextSpan(
                          text: 'Register',
                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                        ),
                      ],
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
