import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:use_of_sentiment_analysis_in_citizen_participation/addOpinion.dart';
import 'package:use_of_sentiment_analysis_in_citizen_participation/postOpinion.dart';
import 'package:use_of_sentiment_analysis_in_citizen_participation/viewOpinion.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("OpinionHub"),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 30),
              child: Icon(Icons.notifications),
            )
          ],
        ),
        body: Consumer(builder: (context, ref, child) {
          return StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('Opinion').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final document = snapshot.data!.docs;
                      return Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(Icons.person_outline),
                              InkWell(
                                onTap: () {
                                  Get.to(() => const postOpinion());
                                },
                                child: Container(
                                  height: 50,
                                  width: 300,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 1,
                                            spreadRadius: 1,
                                            color: Colors.grey)
                                      ]),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Post for Opinion",
                                        style: TextStyle(
                                            color: Colors.grey.shade700),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.photo))
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Divider(
                            color: Colors.grey.shade400,
                            thickness: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                            child: Container(
                              height: 220,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 1,
                                        spreadRadius: 1,
                                        color: Colors.grey)
                                  ]),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Icon(Icons.person),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(document[index]["Name"])
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        document[index]["Question"],
                                        style: const TextStyle(
                                            fontSize: 21,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Divider(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextButton(
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.add,
                                              color: Colors.grey.shade700,
                                            ),
                                            Text(
                                              "Add Opinion",
                                              style: TextStyle(
                                                  color: Colors.grey.shade700),
                                            ),
                                          ],
                                        ),
                                        onPressed: () {
                                          Get.to(() => addOpinion(
                                                Question: document[index]
                                                    ["Question"],
                                                uid: document[index]["UserId"],
                                              ));
                                        },
                                      ),
                                      TextButton(
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.comment,
                                              color: Colors.grey.shade700,
                                            ),
                                            Text(
                                              "View Opinion",
                                              style: TextStyle(
                                                  color: Colors.grey.shade700),
                                            ),
                                          ],
                                        ),
                                        onPressed: () {
                                          Get.to(() => viewOpinion(
                                                documentId: document[index]
                                                    ["UserId"],
                                                Question: document[index]
                                                    ["Question"],
                                              ));
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    });
              } else if (snapshot.hasError) {
                throw "${snapshot.error}";
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        }));
  }
}
