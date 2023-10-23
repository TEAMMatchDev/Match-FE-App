import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NumberInputFieldExample extends GetView {
  final TextEditingController textController = TextEditingController();
  final RxString inputValue = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NumberInputField(
          textController: textController,
          placeHolder: "직접 입력",
          onChanged: (value) {
            // Handle the input value here
            inputValue.value = value;
          },
          isPlain: true,
        ),
        Obx(() {
          return Text("Input Value: ${inputValue.value}");
        }),
      ],
    );
  }
}

class NumberInputField extends StatelessWidget {
  final TextEditingController textController;
  final String placeHolder;
  final void Function(String) onChanged;
  final bool isPlain;

  NumberInputField({
    Key? key,
    required this.textController,
    required this.placeHolder,
    required this.onChanged,
    this.isPlain = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
        labelText: placeHolder,
        filled: isPlain,
        fillColor: isPlain ? Colors.white : Colors.grey,
      ),
      keyboardType: TextInputType.number,
      onChanged: onChanged,
    );
  }
}
