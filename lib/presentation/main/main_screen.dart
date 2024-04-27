import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ibm_task/presentation/utils/color_manager.dart';
import 'package:ibm_task/presentation/utils/routes_manager.dart';
import 'package:ibm_task/presentation/utils/strings_manager.dart';
import 'package:ibm_task/presentation/utils/styles_manager.dart';
import 'package:ibm_task/presentation/utils/values_manager.dart';
import 'package:ibm_task/widget/custom_button.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../blocs/bloc_exports.dart';
import '../../models/bmi.dart';
import '../../widget/container_box.dart';
import '../../widget/data_container.dart';

final activeColor = ColorManager.primary;
const inActiveColor = ColorManager.dustGrey;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Color maleBoxColor = activeColor;
  Color femaleBoxColor = inActiveColor;
  int height = 180;
  int weight = 70;
  int gender = 1;

  int age = 20;
  String result = "";
  String resultDetail = "";
  double bmi = 0;

  void updateBoxColor(int gender) {
    if (gender == 1) {
      if (maleBoxColor == inActiveColor) {
        maleBoxColor = activeColor;
        femaleBoxColor = inActiveColor;
      } else {
        maleBoxColor = inActiveColor;
        femaleBoxColor = activeColor;
      }
    } else {
      if (femaleBoxColor == inActiveColor) {
        femaleBoxColor = activeColor;
        maleBoxColor = inActiveColor;
      } else {
        femaleBoxColor = inActiveColor;
        maleBoxColor = activeColor;
      }
    }
  }

  String calculateBmi(int weight, int height) {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getInterpretation(double bmi) {
    if (bmi >= 25) {
      return "You have a higher than normal body weight. Try to exercise more.";
    } else if (bmi > 18.5) {
      return "You have normal body weight. Good job!";
    } else {
      return "You have a lower than normal body weight.You can eat a bit more now.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        title: Text(
          AppStrings.mainTitle,
          style: headline2.copyWith(color: ColorManager.deepBlue),
        ),
        elevation: AppSize.s0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: ColorManager.lightPrimary,
            statusBarBrightness: Brightness.light),
      ),
      backgroundColor: ColorManager.white,
      body: Column(
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              GenderContainerBox(
                boxColor: maleBoxColor,
                childWidget: DataContainer(
                  icon: FontAwesomeIcons.mars,
                  title: AppStrings.male,
                  color: ColorManager.turquoise,
                ),
                onTap: () {
                  setState(() {
                    gender = 1;
                    updateBoxColor(gender);
                  });
                },
              ),
              GenderContainerBox(
                boxColor: femaleBoxColor,
                childWidget: DataContainer(
                  icon: FontAwesomeIcons.venus,
                  title: AppStrings.female,
                  color: ColorManager.peach,
                ),
                onTap: () {
                  setState(() {
                    gender = 2;
                    updateBoxColor(gender);
                  });
                },
              ),
            ],
          )),
          ContainerBox(
            boxColor: inActiveColor,
            childWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(AppStrings.height,
                    style: bodyText2.copyWith(color: ColorManager.deepBlue)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(height.toString(),
                        style:
                            headline1.copyWith(color: ColorManager.deepBlue)),
                    Text(AppStrings.cm,
                        style:
                            bodyText2.copyWith(color: ColorManager.deepBlue)),
                  ],
                ),
                Slider(
                  value: height.toDouble(),
                  min: 120,
                  max: 220,
                  thumbColor: ColorManager.primary,
                  activeColor: ColorManager.turquoise,
                  inactiveColor: ColorManager.lightGrey,
                  onChanged: (double newValue) {
                    setState(() {
                      height = newValue.round();
                    });
                  },
                )
              ],
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ContainerBox(
                    boxColor: inActiveColor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(AppStrings.weight,
                            style: bodyText2.copyWith(
                                color: ColorManager.deepBlue)),
                        Text(weight.toString(),
                            style: headline1.copyWith(
                                color: ColorManager.deepBlue)),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              backgroundColor: activeColor,
                              child: const Icon(FontAwesomeIcons.plus,
                                  color: Colors.white),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            const SizedBox(width: 10.0),
                            FloatingActionButton(
                                backgroundColor: activeColor,
                                child: const Icon(FontAwesomeIcons.minus,
                                    color: Colors.white),
                                onPressed: () {
                                  setState(() {
                                    if (weight > 1) {
                                      weight--;
                                    }
                                  });
                                })
                          ],
                        )
                      ],
                    )),
              ),
              Expanded(
                child: ContainerBox(
                    boxColor: inActiveColor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(AppStrings.age,
                            style: bodyText2.copyWith(
                                color: ColorManager.deepBlue)),
                        Text(age.toString(),
                            style: headline1.copyWith(
                                color: ColorManager.deepBlue)),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              backgroundColor: activeColor,
                              child: const Icon(FontAwesomeIcons.plus,
                                  color: Colors.white),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            const SizedBox(width: 10.0),
                            FloatingActionButton(
                                backgroundColor: activeColor,
                                child: const Icon(FontAwesomeIcons.minus,
                                    color: Colors.white),
                                onPressed: () {
                                  setState(() {
                                    if (age > 1) {
                                      age--;
                                    }
                                  });
                                })
                          ],
                        )
                      ],
                    )),
              ),
            ],
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("To view your BMI History"),
              const SizedBox(
                width: 5,
              ),
              GestureDetector(
                  onTap: () {
                    BlocProvider.of<BmiBloc>(context).add(FetchBMIEvent());
                    Navigator.of(context)
                        .pushReplacementNamed(Routes.historyPage);
                  },
                  child: Text(
                    AppStrings.history,
                    style: TextStyle(
                        color: ColorManager.primary,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          ),
          Container(
              margin: const EdgeInsets.all(AppMargin.m16),
              height: AppSize.s50,
              child: BlocBuilder<BmiBloc, BmiState>(
                builder: (context, state) {
                  return CustomButton(
                      label: AppStrings.calculate,
                      onClick: () {
                        setState(() {
                          result = calculateBmi(weight, height);
                          resultDetail = getInterpretation(bmi);
                          resultDialog(context);
                        });
                        BlocProvider.of<BmiBloc>(context)
                            .add(BmiInitialEvent(BmiModel(
                          gander: gender,
                          height: height,
                          weight: weight,
                          age: age,
                          bmi: bmi,
                        )));
                      });
                },
              ))
        ],
      ),
    );
  }

  void resultDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: ColorManager.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(
                  height: AppMargin.m30,
                ),
                SfRadialGauge(
                    title: const GaugeTitle(
                        text: 'BMI',
                        textStyle: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                    axes: <RadialAxis>[
                      RadialAxis(
                          minimum: 0,
                          maximum: 50,
                          startAngle: 180,
                          endAngle: 0,
                          radiusFactor: 0.90,
                          showAxisLine: false,
                          showLastLabel: true,
                          showLabels: true,
                          canRotateLabels: false,
                          ranges: <GaugeRange>[
                            GaugeRange(
                              startValue: 0,
                              endValue: 16,
                              color: Colors.red[700],
                              startWidth: 10,
                              endWidth: 10,
                            ),
                            GaugeRange(
                              startValue: 16,
                              endValue: 17,
                              color: Colors.red[300],
                              startWidth: 10,
                              endWidth: 10,
                            ),
                            GaugeRange(
                                startValue: 17,
                                endValue: 18.5,
                                color: Colors.yellow,
                                startWidth: 10,
                                endWidth: 10),
                            GaugeRange(
                                startValue: 18.5,
                                endValue: 25,
                                color: Colors.green,
                                startWidth: 10,
                                endWidth: 10),
                            GaugeRange(
                                startValue: 25,
                                endValue: 30,
                                color: Colors.yellow,
                                startWidth: 10,
                                endWidth: 10),
                            GaugeRange(
                                startValue: 30,
                                endValue: 35,
                                color: Colors.red[300],
                                startWidth: 10,
                                endWidth: 10),
                            GaugeRange(
                                startValue: 35,
                                endValue: 40,
                                color: Colors.red[600],
                                startWidth: 10,
                                endWidth: 10),
                            GaugeRange(
                                startValue: 40,
                                endValue: 50,
                                color: Colors.red,
                                startWidth: 10,
                                endWidth: 10),
                          ],
                          pointers: <GaugePointer>[
                            NeedlePointer(
                              value: bmi,
                              // needleEndWidth: 2,
                              needleStartWidth: 2,
                            )
                          ],
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(
                                widget: Text('BMI = ${result}',
                                    style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)),
                                angle: 90,
                                positionFactor: 0.5)
                          ])
                    ]),
                Text(
                  resultDetail,
                  style: headline3,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: AppMargin.m30,
                ),
              ],
            ),
          );
        });
  }
}
