import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/api/database.dart';
import 'package:jboss_ui/states/colors_list_page_state.dart';
import 'package:jboss_ui/utils/dev_log.dart';

final colorsListPageProvider =
    StateNotifierProvider<ColorListPageStateNotifer, ColorsListPageState>(
  (ref) => ColorListPageStateNotifer(
    const ColorsListPageState(
      colorsList: [],
      currentColor: Colors.white,
    ),
  ),
);

class ColorListPageStateNotifer extends StateNotifier<ColorsListPageState> {
  ColorListPageStateNotifer(
    ColorsListPageState state,
  ) : super(state);

  getColors() async {
    final colorItems = await DbApi.getColorItems();
    state = state.copyWith(colorsList: colorItems);
  }

  setColor({required Color color}) {
    state = state.copyWith(currentColor: color);
  }

  addColor({required Color color}) {
    DbApi.addColor(color: color);
    getColors();
  }

  deleteColor({required int id}) {
    try {
      DbApi.deleteColor(id: id);
    } catch (e) {
      "Возникло исключение $e".log();
      "--- Не удаляется цвет ---".log();
    }
    getColors();
  }
}
