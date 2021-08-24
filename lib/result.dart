import 'dart:ffi';

import 'package:flutter/material.dart';

class result extends StatelessWidget {
  final int resultscore;
  final Function resethandler;
  result(this.resultscore, this.resethandler);

  String get resultphrase {
    var resultText;
    if (resultscore <= 3) {
      resultText = 'You are good';
    } else if (resultscore <= 8) {
      resultText = 'You are awesome';
    } else if (resultscore <= 12) {
      resultText = 'Perfect!';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultphrase,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: () => resethandler(),
            child: Text('Restart Quiz!'),
          )
        ],
      ),
    );
  }
}
