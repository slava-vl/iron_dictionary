
import 'package:flutter/material.dart';

class WordCard extends StatelessWidget {
  final String origin;
  final String translate;

  const WordCard({
    Key? key,required this.origin,required this.translate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black,
                offset: Offset(0, 1),
                blurRadius: 5)
          ]),
      child: Text('$origin/$translate'),
    );
  }
}
