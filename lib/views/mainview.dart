import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waei_testcase/topics.dart' as t;
import 'package:waei_testcase/views/formulaview.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  t.Element? elementChosen;
  t.Topic? topicChosen;
  List<t.Keyword> keywordChosen = [];
  List<bool> keywordSelects = [];
  @override
  Widget build(BuildContext context) {
    t.TopicsProvider elements = context.read<t.TopicsProvider>();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton<t.Element>(
              value: elementChosen,
              items: elements
                  .getElements()
                  .map<DropdownMenuItem<t.Element>>((value) {
                return DropdownMenuItem(child: Text(value.title), value: value);
              }).toList(),
              onChanged: (element) {
                setState(() {
                  elementChosen = element;
                  keywordChosen = [];

                  topicChosen = null;
                });
              }),
          Builder(builder: (context) {
            if (elementChosen == null) {
              return Container();
            } else {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: elementChosen!.topicsIncluded.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, left: 50, right: 50),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            topicChosen = elementChosen!.topicsIncluded[index];
                            keywordChosen = [];
                            keywordSelects = List.generate(
                                topicChosen!.keywords.length, (i) => false);
                          });
                        },
                        child: Ink(
                          height: 50,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 234, 234, 234),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    offset: const Offset(0, 2))
                              ]),
                          child: Center(
                              child: Text(
                                  elementChosen!.topicsIncluded[index].topic)),
                        ),
                      ),
                    );
                  });
            }
          }),
          Builder(builder: (context) {
            if (topicChosen == null) {
              return Container();
            } else {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: topicChosen!.keywords.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Checkbox(
                          value: keywordSelects[index],
                          onChanged: (value) {
                            if (value == true) {
                              keywordChosen.add(topicChosen!.keywords[index]);
                            } else {
                              keywordChosen
                                  .remove(topicChosen!.keywords[index]);
                            }
                            setState(() {
                              keywordSelects[index] = !keywordSelects[index];
                            });
                          },
                        ),
                        Text(
                            "${topicChosen!.keywords[index].keyword}, ${topicChosen!.keywords[index].variable}")
                      ],
                    );
                  });
            }
          }),
          Builder(builder: (context) {
            if (keywordChosen.isEmpty) {
              return Container();
            } else {
              return InkWell(
                onTap: () {
                  for (var element in keywordChosen) {
                    print(element.keyword);
                  }
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FormulaView(
                          element: elementChosen!,
                          topic: topicChosen!,
                          keywords: keywordChosen)));
                },
                child: Ink(
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 234, 234, 234),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            offset: const Offset(0, 2))
                      ]),
                  child: const Center(child: Text('Generate Formula')),
                ),
              );
            }
          })
        ],
      ),
    );
  }
}
