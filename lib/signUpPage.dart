import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:use_of_sentiment_analysis_in_citizen_participation/loginPage.dart';
import 'package:use_of_sentiment_analysis_in_citizen_participation/provider/authProvider.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final fullnamecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final repasswordcontroller = TextEditingController();
  final _form = GlobalKey<FormState>();
  bool isvisible = false;
  bool isvisibleagain = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Signup"),
        ),
        body: Form(
          key: _form,
          child: Consumer(builder: (context, ref, child) {
            return ListView(children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  // InkWell(
                  //   child: Container(
                  //     height: 30,
                  //     width: 170,
                  //     decoration: BoxDecoration(
                  //         color: contestant ? Colors.red : Colors.white,
                  //         border: Border.all(
                  //             color: contestant ? Colors.red : Colors.black)),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Icon(
                  //           Icons.person_outlined,
                  //           color: contestant ? Colors.white : Colors.black,
                  //         ),
                  //         const SizedBox(
                  //           width: 10,
                  //         ),
                  //         Text(
                  //           "Contestant",
                  //           style: TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               color:
                  //                   contestant ? Colors.white : Colors.black),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  //   onTap: () {
                  //     ref.read(iscontestant.notifier).toggle();
                  //   },
                  // ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Full Name",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 1,
                                spreadRadius: 1,
                                color: Colors.grey)
                          ],
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return " value is null";
                          }
                          // else if (value != passwordcontroller.text) {
                          //   return "password not matching";
                          // }
                          else {
                            return null;
                          }
                        }),
                        controller: fullnamecontroller,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.all(8),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Email Id",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 1,
                                spreadRadius: 1,
                                color: Colors.grey)
                          ],
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return " value is null";
                          }
                          // else if (value != passwordcontroller.text) {
                          //   return "password not matching";
                          // }
                          else {
                            return null;
                          }
                        }),
                        controller: emailcontroller,
                        decoration: const InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(8),
                            border: InputBorder.none),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Password",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 1,
                                spreadRadius: 1,
                                color: Colors.grey)
                          ],
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        obscureText: isvisibleagain,
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return " value is null";
                          }
                          // else if (value != passwordcontroller.text) {
                          //   return "password not matching";
                          // }
                          else {
                            return null;
                          }
                        }),
                        controller: passwordcontroller,
                        decoration: InputDecoration(
                            suffixIcon: InkWell(
                              child: isvisibleagain
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                              onTap: () {
                                setState(() {
                                  isvisibleagain = !isvisibleagain;
                                });
                              },
                            ),
                            isDense: true,
                            contentPadding: EdgeInsets.all(8),
                            border: InputBorder.none),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Confirm Password",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 1,
                                spreadRadius: 1,
                                color: Colors.grey)
                          ],
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        obscureText: isvisible,
                        controller: repasswordcontroller,
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return " value is null";
                          } else if (value != passwordcontroller.text) {
                            return "password not matching";
                          } else {
                            return null;
                          }
                        }),
                        decoration: InputDecoration(
                            suffixIcon: InkWell(
                              child: isvisible
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                              onTap: () {
                                setState(() {
                                  isvisible = !isvisible;
                                });
                              },
                            ),
                            isDense: true,
                            contentPadding: EdgeInsets.all(8),
                            border: InputBorder.none),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 12.0, right: 12.0, top: 20.0),
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Text(
                        "SignUp",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                onTap: () async {
                  _form.currentState!.save();
                  if (_form.currentState!.validate()) {
                    FocusScope.of(context).unfocus();
                    ref.watch(authprovider).userSignup(
                        fullnamecontroller.text.trim(),
                        emailcontroller.text.trim(),
                        passwordcontroller.text.trim());

                    Get.to(() => const LoginPage());
                  } else {
                    return null;
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "Already have an account?",
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(() => const LoginPage());
                      },
                      child: const Text("LogIn"))
                ],
              ),
            ]);
          }),
        ));
  }
}
