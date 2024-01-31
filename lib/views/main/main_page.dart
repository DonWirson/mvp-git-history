import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select a branch"),
      ),
      body: ListView.separated(
        itemCount: 20,
        itemBuilder: (context, index) {
          return const ListTile(
            title: Text("Titulo:"),
            subtitle: Text("Comitter:"),
            trailing: Text("Hora:"),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
      ),
    );
  }
}
