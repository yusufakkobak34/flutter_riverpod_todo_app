import 'package:flutter/material.dart';
import 'package:riverpod_todo_app/utils/custom_app_bar.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar()
        ),
     body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Row(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Bugünün Görevleri"),
                  Text("1 Haziran Perşembe"),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("+ Yeni Görev"),
                )
              ],
            )
          ],
        ),
      ),
     ),   
    );
  }
}
