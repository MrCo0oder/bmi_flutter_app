part of 'bmi_bloc.dart';

abstract class BmiEvent {}

class BmiInitialEvent extends BmiEvent {
  BmiModel bmiModel;
  BmiInitialEvent(this.bmiModel);
}
class FetchBMIEvent extends BmiEvent{}




