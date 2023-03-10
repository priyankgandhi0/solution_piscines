import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/WeekDaysModel.dart';
import '../../../utils/SharedPreference.dart';

class NotificationController extends GetxController{
  // var timeText = '10:05 AM';
  // TimeOfDay? pickedTime;
  var notificationOnOff = false;
  // String? selectedTime = preferences.getString("selectedTime");


  @override
  void onInit() {
    notificationOnOff = preferences.getBool(SharedPreference.IS_NOTIFICATION_ON) ?? false;

    // timeText = preferences.getString(SharedPreference.SELECTED_TIME) ?? '10:05 AM';

    List<String> tempWeekList = preferences.getList(SharedPreference.WEEK_LIST) ?? [];

    if (tempWeekList.isNotEmpty) {
      weekList = tempWeekList.map((e) => WeekDaysModel.fromJson(jsonDecode(e))).toList();
    }

    super.onInit();
    }

  List<WeekDaysModel> weekList = [
    WeekDaysModel(
      id: 7,
      isSelected: false,
      weekDayName: "Sunday",
    ),
    WeekDaysModel(
        id: 1,
        isSelected: false,
        weekDayName: "Monday",
    ),
    WeekDaysModel(
        id: 2,
        isSelected: false,
        weekDayName: "Tuesday",
    ),
    WeekDaysModel(
        id:3,
        isSelected: false,
        weekDayName: "Wednesday",
    ),
    WeekDaysModel(
        id:4,
        isSelected: false,
        weekDayName: "Thursday",
    ),
    WeekDaysModel(
        id:5,
        isSelected: false,
        weekDayName: "Friday",
        
    ),WeekDaysModel(
        id:6,
        isSelected: false,
        weekDayName: "Saturday",
    ),
  ];

  selectDay(){
    for (var element in weekList) {
      if (element.isSelected) {
        element.isSelected = false;
      }
    }
    update();
  }

}