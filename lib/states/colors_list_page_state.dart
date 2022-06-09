import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jboss_ui/models/database/color_item.dart';
part 'colors_list_page_state.freezed.dart';

@freezed
class ColorsListPageState with _$ColorsListPageState {
  const factory ColorsListPageState({
    required Color currentColor,
    required List<ColorItem> colorsList,
  }) = _ColorsListPageState;
}
