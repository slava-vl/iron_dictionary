import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../models/word.dart';
import '../widgets/word_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Word> _words;
  bool _isSearchingMode = false;

  @override
  void initState() {
    _words = words;
    super.initState();
  }

  void _toggleSearchingMode() {
    setState(() {
      _isSearchingMode = !_isSearchingMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'ID',
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _toggleSearchingMode();
            },
            icon: const Icon(
              Icons.search_outlined,
              color: Colors.black,
            ),
          )
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          AnimatedCrossFade(
            firstChild: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    value = value.toLowerCase().trim();
                    _words = words
                        .where((element) =>
                            element.origin.toLowerCase().contains(value) ||
                            element.translate.toLowerCase().contains(value))
                        .toList();
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Поиск',
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: _toggleSearchingMode,
                  ),
                ),
              ),
            ),
            secondChild: const SizedBox(width: double.infinity),
            duration: const Duration(milliseconds: 200),
            crossFadeState: _isSearchingMode
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
          ),
          Expanded(
            child: ListView(
              children: [
                ..._words
                    .map((word) => WordCard(
                          origin: word.origin,
                          translate: word.translate,
                        ))
                    .toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
