import 'package:flutter/material.dart';

class WordCard extends StatelessWidget {
  final String origin;
  final String translate;

  const WordCard({
    Key? key,
    required this.origin,
    required this.translate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.grey, offset: Offset(0, 1), blurRadius: 5)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              origin.toUpperCase()[0] + origin.toLowerCase().substring(1),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text('Перевод: ${translate.toLowerCase()}')
          ],
        ));
  }
}
