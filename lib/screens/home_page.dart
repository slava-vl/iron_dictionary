import 'package:flutter/material.dart';
import 'package:iron_dictionary/dummy_data.dart';

import '../widgets/word_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'ID',
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(),
            Column(
              children: [
                ...words.map((word) => WordCard(
                      origin: word.origin,
                      translate: word.translate,
                    )).toList(),
                    ...words.map((word) => WordCard(
                      origin: word.origin,
                      translate: word.translate,
                    )).toList(),
                    ...words.map((word) => WordCard(
                      origin: word.origin,
                      translate: word.translate,
                    )).toList(),
                    
              ],
            )
          ],
        ),
      ),
    );
  }
}
