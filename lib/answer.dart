import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  // final Function? selectHandler;
  final String answerText;
  final VoidCallback selectHandler;
  const Answer(
      {super.key, required this.selectHandler, required this.answerText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.red),
        ),
        onPressed: selectHandler,
        child: Text(answerText),
      ),
    );
  }
}
