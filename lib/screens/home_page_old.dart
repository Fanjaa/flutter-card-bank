import 'package:flutter/material.dart';
import 'package:test_app/widgets/header.dart';
import '../widgets/counter_widget_old.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Counter Clean App")),
      // body: const Center(child: CounterWidget()),
      body: Column(
        children: const [
          HeaderWidget(title: "ini Header Widget"),
          Center(child: CounterWidget()),
        ],
      )
    );
  }
}
