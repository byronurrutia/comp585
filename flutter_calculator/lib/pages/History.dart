import 'package:flutter/material.dart';
import 'package:flutter_calculator/services/Calculation.dart';

class History extends StatelessWidget {
  final List<Calculation> items;

  History({required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return ListTile(
              title: Text(item.calculation),
              subtitle: Text(item.result),
            );
          }),
    );
  }
}
