import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.send,
                      size: 30,
                    ),
                    hintText:
                        "Drop your plan, question,suggestions,feedbacks and more",
                    hintStyle: TextStyle(fontSize: 22)),
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
  }
}
