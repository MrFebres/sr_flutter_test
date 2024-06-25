import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LogsScreen extends StatelessWidget {
  const LogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        if (details.delta.dx > 0) {
          context.pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const SizedBox(),
        ),
        body: const Center(
          child: Text('Logs Screen'),
        ),
      ),
    );
  }
}
