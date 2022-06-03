import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:jboss_ui/screens/search_screen/pages/new_task_page.dart';
import 'package:jboss_ui/screens/search_screen/pages/search_page.dart';

final searchNavigationProvider =
    StateProvider((ref) => SearchScreenOption.search);

enum SearchScreenOption {
  search(
    screen: SearchPage(),
  ),
  newDevice(
    screen: NewTaskPage(),
  );

  final Widget screen;
  const SearchScreenOption({
    required this.screen,
  });
}

class SearchScreen extends ConsumerWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchNavigation = ref.watch(searchNavigationProvider);

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: searchNavigation.screen,
    );
  }
}
