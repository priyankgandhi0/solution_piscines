import 'dart:convert';
import 'dart:ffi';
/// waterId : "round"
/// volume : "15.5"
/// chlorine : "1"
/// ph : "7.4"
/// alkalinity : "250"

ResultData resultDataFromJson(String str) => ResultData.fromJson(json.decode(str));

String resultDataToJson(ResultData data) => json.encode(data.toJson());

class ResultData {
  ResultData({
    required this.waterId,
    required this.volume,
    required this.chlorine,
    required this.ph,
    required this.alkalinity,
  });

  String waterId;
  String volume;
  String chlorine;
  String ph;
  String alkalinity;

  factory ResultData.fromJson(Map<String, dynamic> json) => ResultData(
    waterId: json["waterId"],
    volume: json["volume"],
    chlorine: json["chlorine"],
    ph: json["ph"],
    alkalinity: json["alkalinity"],
  );

  Map<String, dynamic> toJson() => {
    "waterId": waterId,
    "volume": volume,
    "chlorine": chlorine,
    "ph": ph,
    "alkalinity": alkalinity,
  };
}
