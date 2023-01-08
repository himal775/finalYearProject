import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:use_of_sentiment_analysis_in_citizen_participation/postOpinion.dart';

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
      body: Column(
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
                  Get.to(() => postOpinion());
                },
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 1, spreadRadius: 1, color: Colors.grey)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Post for Opinion",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.photo))
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
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 1, spreadRadius: 1, color: Colors.grey)
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text("Question"),
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              style: TextStyle(color: Colors.grey.shade700),
                            ),
                          ],
                        ),
                        onPressed: () {},
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
                              style: TextStyle(color: Colors.grey.shade700),
                            ),
                          ],
                        ),
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
