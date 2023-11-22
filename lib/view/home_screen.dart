import 'package:flutter/material.dart';
import 'package:football_app/app_constance/values_manager.dart';
import '../widgets/drawer_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DefaultDrawerWidget(),
      appBar: AppBar(
        title: const Text('Test Api'),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSize.s10),
        child: const Column(
          children: [],
        ),
      ),
    );
  }
}
