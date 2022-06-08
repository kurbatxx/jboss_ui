import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/api/database.dart';
import 'package:jboss_ui/states/colors_list_page_state.dart';

final colorsListPageProvider =
    StateNotifierProvider<ColorListPageStateNotifer, ColorsListPageState>(
  (ref) => ColorListPageStateNotifer(
    const ColorsListPageState(
      colorsList: [],
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
}
