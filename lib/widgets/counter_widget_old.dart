import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0; // private counter

  // Method untuk menambah counter
  void _increment() => setState(() => _counter++);

  // Method untuk mengurangi counter, minimal 0
  void _decrement() => setState(() {
        if (_counter > 0) _counter--;
      });

  // Method untuk reset counter
  void _reset() => setState(() => _counter = 0);

  @override
  Widget build(BuildContext context) {
    return Column(
      
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(children: [
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ]),
        
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: _increment,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(width: 16),
            FloatingActionButton(
              onPressed: _decrement,
              tooltip: 'Decrement',
              backgroundColor: Colors.red,
              child: const Icon(Icons.remove),
            ),
            const SizedBox(width: 16),
            FloatingActionButton(
              onPressed: _reset,
              tooltip: 'Reset',
              backgroundColor: Colors.orange,
              child: const Icon(Icons.refresh),
            ),
          ],
        ),
      ],
    );
  
  }
}
