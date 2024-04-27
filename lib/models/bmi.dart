


class BmiModel {
  
  final  int gander;
  final  int height;
  final int weight;
  final int age;
  final double bmi;

  BmiModel({
    required this.gander,
    required this.height,
    required this.weight,
    required this.age,
    required this.bmi,
  });

  factory BmiModel.fromJson(Map<String,dynamic> json) =>  BmiModel(
      gander: json["gander"]??0,
      height: json["height"],
      weight: json["weight"]??0,
      age: json["age"]??0,
      bmi: json["bmi"]??0.0);
  

    Map<String, dynamic> toJson() => {
    "gander" : gander,
    "height": height,
    "weight": weight,
    "age": age,
    "bmi": bmi,
    };
}