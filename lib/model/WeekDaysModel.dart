
class WeekDaysModel{
  factory WeekDaysModel.fromJson(Map<String, dynamic> json) => WeekDaysModel(
    id: json["id"],
    weekDayName: json["weekDayName"],
    isSelected: json["isSelected"],
  );

  WeekDaysModel({required this.id,required this.weekDayName,required this.isSelected});
  int id;
  String weekDayName;
  bool isSelected = false;

  Map<String, dynamic> toJson() => {
    "id": id,
    "weekDayName": weekDayName,
    "isSelected": isSelected,
  };
}