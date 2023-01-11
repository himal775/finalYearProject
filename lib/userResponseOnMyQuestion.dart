import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:use_of_sentiment_analysis_in_citizen_participation/provider/crud.dart';

class UserResponse extends StatelessWidget {
  const UserResponse({super.key});

  @override
  Widget question(context) {
    return Consumer(
      builder: (context, ref, child) {
        final questionData = ref.watch(crudprovider).myQuestion();
        return FutureBuilder(
          future: questionData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        "${snapshot.data}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  )
                ],
              );
            } else if (snapshot.data == null) {
              return const Text("You have not posted for opinion yet");
            } else if (snapshot.hasError) {
              return const Text("You have not posted for opinion yet");
            } else {
              return const Text("Loading");
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer(
        builder: (context, ref, child) {
          final data = ref.watch(crudprovider).viewUserResponse();
          return FutureBuilder(
            future: data,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final text = snapshot.data!.length;
                final data = snapshot.data;
                int positiveCount =
                    data!.where((map) => map['Status'] == 'Positive').length;
                int NegativeCount =
                    data.where((map) => map['Status'] == 'Negative').length;
                int Neutral =
                    data.where((map) => map['Status'] == 'Neutral').length;

                print(snapshot.data);
                return Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 220,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 1,
                                spreadRadius: 1,
                                color: Colors.grey),
                          ]),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          question(context),
                          const SizedBox(
                            height: 20,
                          ),
                          const Divider(
                            height: 10,
                            color: Colors.grey,
                            thickness: 2,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text("Total response: $text"),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text("Postive response: $positiveCount"),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text("Negative response: $NegativeCount"),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text("Negative response: $Neutral"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                );
              } else if (snapshot.data == null) {
                return const Text("You have not posted for opinion yet");
              } else if (snapshot.hasError) {
                return const Text("You have not posted for opinion yet");
              } else {
                return const Text("Loading");
              }
            },
          );
        },
      ),
    );
  }
}
