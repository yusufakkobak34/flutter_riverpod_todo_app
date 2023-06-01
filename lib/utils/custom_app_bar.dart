import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget{
  const CustomAppBar({super.key});

  Size get preferedSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      title: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.amber.shade300,
          radius: 25,
          child: Image.asset('assets/asset1.png'),
        ),
        title: Text(
          "Merhaba,Ben",
          style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
        ),
        subtitle: const Text(
          "Yusuf Akkobak",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.calendar),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.bell),
              )
            ],
          ),
        ),
      ],
    );
  }
}
