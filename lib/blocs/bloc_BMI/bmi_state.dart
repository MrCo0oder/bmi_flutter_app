part of 'bmi_bloc.dart';

@immutable
abstract class BmiState {}

abstract class BmiActionState extends BmiState{}


class BmiInitial extends BmiState {}

class BmiLoadingState extends BmiState {}

class BmiErrorState extends BmiState {}

class BmiEmptyState extends BmiState {}

class BmiAddSuccessfulState extends BmiState {}

class BmiFetchSuccessfulState extends BmiState {
  List<BmiModel> bmiList;
  BmiFetchSuccessfulState ({
    required this.bmiList,
  });
}


// class BmiState extends Equatable {
//   final List <Bmi> allBmi;
//   const BmiState({
//     this.allBmi = const <Bmi>[],
//   });

//   @override
//   List<Object> get props => [allBmi];
// }