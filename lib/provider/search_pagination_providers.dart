import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/freezed/pagination_state.dart';

final paginationProvider = StateNotifierProvider<Pagination, PaginationState>(
  (ref) => Pagination(),
);

class Pagination extends StateNotifier<PaginationState> {
  Pagination() : super(const PaginationState.data());

  Future<void> loading() async {
    try {
      state = const PaginationState.loading();
    } catch (e) {
      state = const PaginationState.error(
          "Непридвиденная ошибка. Перезапустите программу");
    }
  }

  Future<void> data() async {
    try {
      state = const PaginationState.data();
    } catch (e) {
      state = const PaginationState.error(
          "Непридвиденная ошибка. Перезапустите программу");
    }
  }
}
