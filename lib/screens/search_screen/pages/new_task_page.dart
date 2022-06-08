import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/provider/new_task_page_provider.dart';
import 'package:jboss_ui/screens/search_screen/search_screen.dart';
import 'package:jboss_ui/utils/constant.dart';

class NewTaskPage extends ConsumerWidget {
  const NewTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(newTaskStateProvider);
    //state.listColoredDevices[0].deviceId;
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
            : Wrap(
                spacing: 4,
                children: List.generate(
                  state.listDevices.length,
                  (index) {
                    return ClipRRect(
                      borderRadius: kMinimumRadius,
                      child: Material(
                        color: state.devicePosition == index
                            ? Colors.green
                            : Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            ref
                                .read(newTaskStateProvider.notifier)
                                .selectDevice(selected: index);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: SizedBox(
                              width: 50,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 40,
                                    child: state.listDevices[index].svgIcon,
                                  ),
                                  FittedBox(
                                    child: Text(
                                      state.listDevices[index].deviceName,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
        Wrap(
          spacing: 4,
          children: List.generate(
            state.listColoredDevices.length,
            (index) {
              return ClipRRect(
                borderRadius: kMinimumRadius,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      ref
                          .read(newTaskStateProvider.notifier)
                          .selectColor(selected: index);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: state.listColoredDevices[index].color,
                                borderRadius: kMinimumRadius,
                              ),
                            ),
                            state.colorPosition == index
                                ? const Center(
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 35.0,
                                    ),
                                  )
                                : const SizedBox()
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Создать заявку'),
        )
      ],
    );
  }
}
