import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoe/app/modules/game/field/field_controller.dart';
import 'package:tictactoe/app/modules/game/field/field_view.dart';

class GameController extends GetxController {
  var playerMove = XOState.x.obs;
  var playerSide = XOState.x.obs;
  var gameIsEnd = false.obs;
  var count = 0.obs;
  late RxList<XOFieldController> fields;
  var gameText = 'Ход Х'.obs;
  void changePlayerMove() {
    gameIsEnd.value = checkGameEnd();
    if (gameIsEnd.value) return;
    //TODO
    playerMove.value = playerMove.value == XOState.x ? XOState.o : XOState.x;
    gameText.value = "Ход ${playerMove.value.str}";
    count.value++;
  }

  @override
  void onInit() {
    initFields();
    super.onInit();
  }

  void initFields() {
    fields = List.generate(9, (index) {
      return Get.put(XOFieldController(num: index),
          tag: "$controllerTag$index");
    }).obs;
  }

  bool checkGameEnd() {
    if (count.value == 8) {
      gameIsEnd.value = true;
      gameText.value = "Закончились ходы";
      return true;
    }
    return false;
  }
}