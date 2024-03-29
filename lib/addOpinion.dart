import 'package:dart_sentiment/dart_sentiment.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:use_of_sentiment_analysis_in_citizen_participation/bottomNavigation.dart';
import 'package:use_of_sentiment_analysis_in_citizen_participation/homePage.dart';
import 'package:use_of_sentiment_analysis_in_citizen_participation/provider/crud.dart';

class addOpinion extends StatefulWidget {
  addOpinion({super.key, required this.Question, required this.uid});
  String Question;
  String uid;

  @override
  State<addOpinion> createState() => _addOpinionState();
}

class _addOpinionState extends State<addOpinion> {
  bool post = false;
  final commentController = TextEditingController();
  final _form = GlobalKey<FormState>();
  final sentiment = Sentiment();
  String status = "Neutral";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Opinion"),
      ),
      body: Consumer(builder: (context, ref, child) {
        return Form(
          key: _form,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.Question,
                  style: const TextStyle(
                      fontSize: 21, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return "Value is Empty";
                    } else {
                      return null;
                    }
                  }),
                  controller: commentController,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        post = true;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                      child: const Icon(Icons.send),
                      onTap: () async {
                        final analysisText = sentiment.analysis(
                            commentController.text,
                            languageCode: LanguageCode.english);
                        print(analysisText['score']);

                        if (analysisText['score'] > 0) {
                          setState(() {
                            status = "Positive";
                          });
                        } else if (analysisText['score'] < 0) {
                          setState(() {
                            status = "Negative";
                          });
                        } else {
                          setState(() {
                            status = "Neutral";
                          });
                        }

                        _form.currentState!.save();
                        if (_form.currentState!.validate()) {
                          final response = await ref
                              .read(crudprovider)
                              .addComment(
                                  Name: FirebaseAuth
                                      .instance.currentUser!.displayName,
                                  Comment: commentController.text.trim(),
                                  score: analysisText['score'],
                                  status: status,
                                  Uid: widget.uid);
                          if (response == "Success") {
                            Get.to(() => AdminBottomNavigation());
                          } else {
                            return null;
                          }
                        } else {
                          return null;
                        }
                      },
                    ),
                    hintText: "Add your opinion",
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
