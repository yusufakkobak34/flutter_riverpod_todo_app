import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_todo_app/constants/app_style.dart';
import 'package:riverpod_todo_app/model/todo_model.dart';
import 'package:riverpod_todo_app/provider/date_time_provider.dart';
import 'package:riverpod_todo_app/provider/radio_provider.dart';
import 'package:riverpod_todo_app/provider/service_provider.dart';
import 'package:riverpod_todo_app/widget/custom_radio_widget.dart';
import 'package:riverpod_todo_app/widget/date_time_widget.dart';
import 'package:riverpod_todo_app/widget/text_field_widget.dart';

class AddNewTaskModel extends ConsumerWidget {
  AddNewTaskModel({
    super.key,
  });

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateProv = ref.watch(dateProvider);
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
          TextFieldWidget(
            maxLine: 1,
            hintText: "Görev Adı Ekleyin",
            txtController: titleController,
          ),
          const Gap(12),
          const Text("Açıklama", style: AppStyle.headingOne),
          const Gap(6),
          TextFieldWidget(
            maxLine: 5,
            hintText: 'Açıklama Ekleyin',
            txtController: descriptionController,
          ),
          const Gap(12),
          const Text("Kategori", style: AppStyle.headingOne),
          Row(
            children: [
              Expanded(
                child: RadioWidget(
                    titleRadio: "LRN",
                    categColor: Colors.green,
                    valueInput: 1,
                    onChangeValue: () =>
                        ref.read(radioProvider.notifier).update((state) => 1)),
              ),
              Expanded(
                child: RadioWidget(
                    titleRadio: "WRK",
                    categColor: Colors.blue.shade700,
                    valueInput: 2,
                    onChangeValue: () =>
                        ref.read(radioProvider.notifier).update((state) => 2)),
              ),
              Expanded(
                child: RadioWidget(
                    titleRadio: "GEN",
                    categColor: Colors.amberAccent.shade700,
                    valueInput: 3,
                    onChangeValue: () =>
                        ref.read(radioProvider.notifier).update((state) => 3)),
              ),
            ],
          ),

          // Date & Time Option
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DateTimeWidget(
                titleText: "Tarih",
                valueText: dateProv,
                iconSection: CupertinoIcons.calendar,
                onTap: () async {
                  final getValue = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2021),
                    lastDate: DateTime(2025),
                  );
                  if (getValue != null) {
                    final format = DateFormat.yMd();
                    ref
                        .read(dateProvider.notifier)
                        .update((state) => format.format(getValue));
                  }
                },
              ),
              const Gap(22),
              DateTimeWidget(
                titleText: "Saat",
                valueText: ref.watch(timeProvider),
                iconSection: CupertinoIcons.clock,
                onTap: () async {
                  final getTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (getTime != null) {
                    ref
                        .read(timeProvider.notifier)
                        .update((state) => getTime.format(context));
                  }
                },
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
                  onPressed: () => Navigator.pop(context),
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
                  onPressed: () {
                    final getRadioValue = ref.read(radioProvider);
                    String category = '';

                    switch (getRadioValue) {
                      case 1:
                        category = "Learning";
                        break;
                      case 2:
                        category = 'Working';
                        break;
                      case 3:
                        category = 'General';
                        break;
                    }

                    ref.read(serviceProvider).addNewTask(TodoModel(
                          titleTask: titleController.text,
                          description: descriptionController.text,
                          category: category,
                          dateTask: ref.read(dateProvider),
                          timeTask: ref.read(timeProvider),
                        ));
                    print('Data is saving');
                    Navigator.pop(context);
                  },
                  child: const Text("Oluştur"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
