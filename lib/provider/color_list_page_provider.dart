import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/api/database.dart';
import 'package:jboss_ui/models/database/color_item.dart';
import 'package:jboss_ui/states/colors_list_page_state.dart';

final colorsListPageProvider =
    StateNotifierProvider<ColorListPageStateNotifer, ColorsListPageState>(
  (ref) => ColorListPageStateNotifer(
    const ColorsListPageState(
      colorsList: [],
      selectedColorsList: [],
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
    print(state.colorsList.map((e) => e.colorId));
    print(state.selectedColorsList.map((e) => e.colorId));
  }

  void setColor({required Color color}) {
    state = state.copyWith(currentColor: color);
  }

  void selectColor({required ColorItem colorItem}) {
    List<ColorItem> selectedColors = [];
    selectedColors.addAll(state.selectedColorsList);
    selectedColors.add(colorItem);
    state = state.copyWith(selectedColorsList: selectedColors);
  }

  void unSelectColor({required ColorItem colorItem}) {
    List<ColorItem> selectedColors = [];
    selectedColors.addAll(state.selectedColorsList);
    selectedColors
        .removeWhere((element) => element.colorId == colorItem.colorId);
    state = state.copyWith(selectedColorsList: selectedColors);
  }

  void addColor({required Color color}) {
    DbApi.addColor(color: color);
    getColors();
  }

  void deleteColor({required ColorItem item}) {
    DbApi.deleteColor(id: item.colorId);
    unSelectColor(colorItem: item);
    getColors();
  }
}
