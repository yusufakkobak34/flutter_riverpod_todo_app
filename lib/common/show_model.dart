import 'package:flutter/material.dart';
import 'package:riverpod_todo_app/constants/app_style.dart';

class AddNewTaskModel extends StatelessWidget {
  const AddNewTaskModel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height * 0.70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: double.infinity,
            child: Text(
              "Yeni Görev Ekle",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
           ),
          Divider(
            thickness: 1.2,
            color: Colors.grey.shade200,
          ),
          const Text(
            "Görev Başlığı",
            style: AppStyle.headingStyle,
            ),
          const TextField(),
        ],
      ),
    );
  }
}
