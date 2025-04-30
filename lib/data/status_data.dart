import 'package:chat_app/model/status_model.dart';
import 'package:flutter/material.dart';

class StatusData extends ChangeNotifier {
  static final StatusData _instance = StatusData._internal();

  factory StatusData() {
    return _instance;
  }

  StatusData._internal();

  final List<StatusModel> statuses = [
    StatusModel(
      name: "Wario",
      imageName: "assets/status/wario_headshot.jpg",
      time: "14:22",
      isSeen: false,
      statusFreq: 3,
    ),
    StatusModel(
      name: "Peach",
      imageName: "assets/status/peach_headshot.jpg",
      time: "13:50",
      isSeen: false,
      statusFreq: 5,
    ),
    StatusModel(
      name: "Toad",
      imageName: "assets/status/toad_headshot.jpg",
      time: "13:15",
      isSeen: false,
      statusFreq: 2,
    ),
    StatusModel(
      name: "Yoshi",
      imageName: "assets/status/yoshi_headshot.jpg",
      time: "12:30",
      isSeen: false,
      statusFreq: 8,
    ),
    StatusModel(
      name: "Daisy",
      imageName: "assets/status/daisy_headshot.jpg",
      time: "10:48",
      isSeen: true,
      statusFreq: 4,
    ),
    StatusModel(
      name: "Bowser",
      imageName: "assets/status/bowser_headshot.jpg",
      time: "09:42",
      isSeen: true,
      statusFreq: 6,
    ),
    StatusModel(
      name: "Waluigi",
      imageName: "assets/status/waluigi_headshot.jpg",
      time: "08:33",
      isSeen: true,
      statusFreq: 1,
    ),
  ];
}
