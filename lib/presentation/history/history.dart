import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibm_task/models/bmi.dart';
import 'package:ibm_task/presentation/utils/color_manager.dart';
import 'package:ibm_task/presentation/utils/routes_manager.dart';

import '../../blocs/bloc_exports.dart';
import '../../widget/historyWidget.dart';
import '../utils/styles_manager.dart';
import '../utils/values_manager.dart';

// i will add bloc builder here to build firebase data
class HistoryPage extends StatelessWidget {
   HistoryPage({super.key});

  final BmiBloc bmiBloc = BmiBloc()..add(FetchBMIEvent());
  final List<BmiModel> list =[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ColorManager.white,
          title: Text(
            'Your BMI History 📃',
            style: headline2.copyWith(color: ColorManager.deepBlue),
          ),
          elevation: AppSize.s0,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: ColorManager.lightPrimary,
              statusBarBrightness: Brightness.light),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(Routes.mainScreen);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: ColorManager.deepBlue,
              ))),
      backgroundColor: ColorManager.white,
      body: BlocConsumer<BmiBloc, BmiState>(
        bloc: bmiBloc,
        builder: (context, state) {
          print(state);
          if (state is BmiFetchSuccessfulState) {
            return ListView.builder(

                itemCount: bmiBloc.bmiList.length,
                itemBuilder: (BuildContext context, int index) {
                  return History(
                    height: bmiBloc.bmiList[index].height,
                    weight: bmiBloc.bmiList[index].weight,
                    gender:
                    bmiBloc.bmiList[index].gander == 1 ? "Male" : "Female",
                    age: bmiBloc.bmiList[index].age,
                    bmiStatus: bmiBloc.bmiList[index].bmi,
                    onDismiss: (DismissDirection direction) {
                      if (direction == DismissDirection.endToStart) {
                        bmiBloc.bmiList.removeAt(index);
                        // DELETE EVENT
                      }
                    },
                    index: index,
                  );
                });
          } else if (state is BmiErrorState) {
            return Center(
              child: Text(
                "Something went error!",
                style: headline3.copyWith(color: ColorManager.error),
              ),
            );
          } else if (state is BmiLoadingState|| state is BmiInitial) {
            return Center(
                child: CircularProgressIndicator(
              color: ColorManager.primary,
            ));
          } else {
            return Center(
              child: Text(
                "No Data Found!",
                style: headline3.copyWith(color: ColorManager.primary),
              ),
            );
          }
        }, listener: (BuildContext context, BmiState state) {  },
      ),
    );
  }
}
