import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/api/database.dart';
import 'package:jboss_ui/states/colors_list_page_state.dart';

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

  void getColors() async {
    final colorItems = await DbApi.getColorItems();
    state = state.copyWith(colorsList: colorItems);
  }

  void setColor({required Color color}) {
    state = state.copyWith(currentColor: color);
  }

  void addColor({required Color color}) {
    DbApi.addColor(color: color);
    getColors();
  }

  void deleteColor({required int id}) {
    DbApi.deleteColor(id: id);
    getColors();
  }
}
