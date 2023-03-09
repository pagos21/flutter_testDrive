import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;
  const Result(
      {super.key, required this.resultScore, required this.resetHandler});

  String get resultPhrase {
    var resultText = "Yeah ";
    if (resultScore < 2) {
      resultText = "Mannaggia a te!";
    } else if (resultScore < 20) {
      resultText = "Non male";
    } else {
      resultText = "MITICOOOO!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: resetHandler,
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.red),
            ),
            child: const Text("RESET!"),
          )
        ],
      ),
    );
  }
}
