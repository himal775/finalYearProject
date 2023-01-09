import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:use_of_sentiment_analysis_in_citizen_participation/homePage.dart';
import 'package:use_of_sentiment_analysis_in_citizen_participation/provider/crud.dart';

class postOpinion extends StatefulWidget {
  const postOpinion({super.key});

  @override
  State<postOpinion> createState() => _postOpinionState();
}

class _postOpinionState extends State<postOpinion> {
  final opinionController = TextEditingController();
  bool post = false;
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Post question"),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: TextFormField(
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        post = true;
                      });
                    }
                  },
                  controller: opinionController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: InkWell(
                        onTap: () async {
                          final response = await ref
                              .read(crudprovider)
                              .uploadData(question: opinionController.text);
                          if (response == "Success") {
                            Get.to(() => const HomePage());
                          } else {
                            return;
                          }
                        },
                        child: const Icon(
                          Icons.send,
                          size: 30,
                        ),
                      ),
                      hintText:
                          "Post for opinion, Drop your plan, question,suggestions,feedbacks and more",
                      hintStyle: const TextStyle(fontSize: 22)),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [],
            ),
          ],
        ),
      );
    });
  }
}
