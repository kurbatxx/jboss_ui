import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/provider/new_task_page_rovider.dart';
import 'package:jboss_ui/screens/search_screen/search_screen.dart';

class NewTaskPage extends ConsumerWidget {
  const NewTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(newTaskStateProvider);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                ref.read(searchNavigationProvider.state).state =
                    SearchScreenOption.search;
              },
              child: const Text('Назад'),
            ),
          ],
        ),
        Text(
          '${state.client.id} ${state.client.fullName.surname} ${state.client.fullName.name} ${state.client.fullName.patronymic} ${state.client.group}',
        ),
        Text(
          state.client.school,
        ),
      ],
    );
  }
}
