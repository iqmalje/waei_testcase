import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:waei_testcase/topics.dart' as t;

class FormulaView extends StatefulWidget {
  final t.Element element;
  final t.Topic topic;
  final List<t.Keyword> keywords;
  const FormulaView(
      {super.key,
      required this.element,
      required this.topic,
      required this.keywords});

  @override
  State<FormulaView> createState() =>
      _FormulaViewState(element, topic, keywords);
}

class _FormulaViewState extends State<FormulaView> {
  final t.Element element;
  final t.Topic topic;
  final List<t.Keyword> keywords;
  _FormulaViewState(this.element, this.topic, this.keywords);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TeXView(
              child: TeXViewContainer(
                  child: TeXViewDocument(
                      element.formulaChecker!(keywords).formula,
                      style: TeXViewStyle.fromCSS(
                          'padding: 15px; color: black; background: transparent'))))
        ],
      ),
    );
  }
}
