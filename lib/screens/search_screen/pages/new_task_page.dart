import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/provider/new_task_page_provider.dart';
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
        state.listDevices.isEmpty
            ? const Text('Установите устройства в настройках')
            : Expanded(
                child: ListView.builder(
                  itemCount: state.listDevices.length,
                  itemBuilder: (context, index) {
                    final device = state.listDevices[index];
                    return ListTile(
                      leading: SizedBox(
                        height: 50,
                        width: 50,
                        child: device.svgIcon,
                      ),
                      title: Text(device.deviceName),
                    );
                  },
                ),
              )
      ],
    );
  }
}
