import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:riverpod_todo_app/constants/app_style.dart';
import 'package:riverpod_todo_app/widget/custom_radio_widget.dart';
import 'package:riverpod_todo_app/widget/date_time_widget.dart';
import 'package:riverpod_todo_app/widget/text_field_widget.dart';

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
          const Gap(12),
          const Text(
            "Görev Başlığı",
            style: AppStyle.headingOne,
          ),
          const Gap(6),
          const TextFieldWidget(maxLine: 1, hintText: "Görev Adı Ekleyin"),
          const Gap(12),
          const Text("Açıklama", style: AppStyle.headingOne),
          const Gap(6),
          const TextFieldWidget(maxLine: 5, hintText: 'Açıklama Ekleyin'),
          const Gap(12),
          const Text("Kategori", style: AppStyle.headingOne),
          Row(
            children: [
              const Expanded(
                child: RadioWidget(titleRadio: "LRN", categColor: Colors.green),
              ),
              Expanded(
                child: RadioWidget(
                    titleRadio: "WRK", categColor: Colors.blue.shade700),
              ),
              Expanded(
                child: RadioWidget(
                    titleRadio: "GEN", categColor: Colors.amberAccent.shade700),
              ),
            ],
          ),

          // Date & Time Option
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DateTimeWidget(
                titleText: "Tarih",
                valueText: "dd/mm/yyyy",
                iconSection: CupertinoIcons.calendar,
              ),
              Gap(22),
              DateTimeWidget(
                titleText: "Saat",
                valueText: "hh : mm",
                iconSection: CupertinoIcons.clock,
              ),
            ],
          ),
          
          //Button Section
          const Gap(12),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue.shade800,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: BorderSide(
                      color: Colors.blue.shade800,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {},
                  child: const Text("İptal"),
                ),
              ),
              const Gap(40),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade800,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {},
                  child: const Text("Oluştur"),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
