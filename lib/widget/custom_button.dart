import 'package:flutter/material.dart';

import '../presentation/utils/styles_manager.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key,required this.label ,required this.onClick});

  VoidCallback onClick;
  String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onClick,
        child: Text(
          label,
          style: buttonText1.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}