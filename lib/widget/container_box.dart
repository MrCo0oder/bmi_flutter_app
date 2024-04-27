import 'package:flutter/material.dart';
import 'package:ibm_task/presentation/utils/values_manager.dart';

class GenderContainerBox extends StatelessWidget {
  const GenderContainerBox({Key? key, required this.boxColor, required this.childWidget, required this.onTap}) : super(key: key);
  final Color boxColor;
  final Widget childWidget;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.all(AppSize.s16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s16),
            border: Border.all(color: boxColor,width: AppSize.s2),
          ),
          child: childWidget,
        ),
      ),
    );
  }
}

class ContainerBox extends StatelessWidget {
  const ContainerBox({Key? key, required this.boxColor, required this.childWidget}) : super(key: key);
  final Color boxColor;
  final Widget childWidget;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
            margin: const EdgeInsets.all(AppSize.s16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s16),
              border: Border.all(color: boxColor),
            ),
            child: childWidget,
      ),
    );
  }
}
