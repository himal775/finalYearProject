import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:get/get.dart';
import 'package:use_of_sentiment_analysis_in_citizen_participation/homePage.dart';
import 'package:use_of_sentiment_analysis_in_citizen_participation/provider/authProvider.dart';
import 'package:use_of_sentiment_analysis_in_citizen_participation/signUpPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  final _form = GlobalKey<FormState>();
  bool isTap = false;
  bool keepLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(),
      body: Consumer(
        builder: ((context, ref, child) {
          return Form(
            key: _form,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "OpinionHub",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Email or Phone Number",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return "Enter password";
                      } else {
                        return null;
                      }
                    }),
                    controller: usernameController,
                    decoration: InputDecoration(
                        hintText: "Enter your email",
                        suffixIcon: const Icon(Icons.supervised_user_circle),
                        isDense: true,
                        contentPadding: EdgeInsets.all(12),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Colors.grey))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return "Enter password";
                      } else {
                        return null;
                      }
                    }),
                    obscureText: !isTap,
                    controller: passwordController,
                    decoration: InputDecoration(
                        hintText: "Enter your password",
                        suffixIcon: InkWell(
                          child: isTap
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                          onTap: (() {
                            setState(() {
                              isTap = !isTap;
                            });
                          }),
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.all(12),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.grey))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: keepLogin,
                          onChanged: (val) {
                            setState(() {
                              keepLogin = !keepLogin;
                            });
                          }),
                      const Text("Keep me login"),
                      const SizedBox(
                        width: 90,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text("Forget Password?"))
                    ],
                  ),
                  InkWell(
                    child: Container(
                      height: 40,
                      width: 1,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(16)),
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                    onTap: () async {
                      _form.currentState!.save();

                      if (_form.currentState!.validate()) {
                        final response = await ref.read(authprovider).userlogin(
                            usernameController.text.trim(),
                            passwordController.text.trim());

                        if (response != "Successful") {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: Duration(seconds: 5),
                              content: Text('$response')));
                        } else if (response == "Loading") {
                          Get.defaultDialog(middleText: "Loading..");
                        } else {
                          Get.to(() => HomePage());
                        }
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Don't have an Account?",
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(() => const SignUp());
                          },
                          child: const Text("Sign Up"))
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
