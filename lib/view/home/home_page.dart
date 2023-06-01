import 'package:flutter/cupertino.dart';
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
    );
  }
}
