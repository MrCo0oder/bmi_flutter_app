import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibm_task/presentation/utils/color_manager.dart';
import 'package:ibm_task/presentation/utils/styles_manager.dart';
import 'package:ibm_task/presentation/utils/values_manager.dart';

class DataContainer extends StatelessWidget {
  DataContainer({Key? key, required this.icon, required this.title,this.color}) : super(key: key);
  final IconData icon;
  final String title;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: AppSize.s60,
          color: color?? ColorManager.white,
        ),
        const SizedBox(height: 15.0),
        Text(title, style: headline3.copyWith(color: ColorManager.deepBlue),),
      ],
    );
  }
}
