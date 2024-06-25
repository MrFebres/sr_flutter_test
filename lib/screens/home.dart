import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Hint and Label TextField',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  label: Text('Username'),
                  prefixIcon: Icon(Icons.people),
                ),
              ),
              SizedBox(height: 8.0),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  label: Text('Password'),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
