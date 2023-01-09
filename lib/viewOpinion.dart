import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:use_of_sentiment_analysis_in_citizen_participation/provider/crud.dart';

class viewOpinion extends StatefulWidget {
  viewOpinion({super.key, required this.documentId, required this.Question});

  String documentId;
  String Question;

  @override
  State<viewOpinion> createState() => _viewOpinionState();
}

class _viewOpinionState extends State<viewOpinion> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final data =
          ref.watch(crudprovider).fetchList(documentId: widget.documentId);
      return Scaffold(
          appBar: AppBar(),
          body: FutureBuilder(
            future: data,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 1,
                                    color: Colors.grey,
                                    spreadRadius: 1)
                              ]),
                          child: Text(
                            widget.Question,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          )),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 4.0, bottom: 4.0, left: 8, right: 8),
                            child: Container(
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade400,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            snapshot.data![index]['Comment by'],
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                    Center(
                                        child: Text(
                                      snapshot.data![index]['Comment'],
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                  ],
                                )),
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return const Text("Error");
              } else {
                return const Text("Loading");
              }
            },
          ));
    });
  }
}
