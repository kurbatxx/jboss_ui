import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/provider/color_list_page_provider.dart';
import 'package:jboss_ui/screens/settings_page/settings_page.dart';
import 'package:jboss_ui/utils/constant.dart';

class ColorsPage extends ConsumerWidget {
  const ColorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(colorsListPageProvider);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                ref.read(settingNavigationProvider.state).state =
                    SettingsScreenOption.availableColors;
              },
              child: const Text('Назад'),
            ),
          ],
        ),
        ColorPicker(
          enableShadesSelection: false,
          pickersEnabled: const {
            ColorPickerType.wheel: true,
            ColorPickerType.accent: false,
            ColorPickerType.primary: false,
          },
          padding: const EdgeInsets.all(4.0),
          wheelHasBorder: true,
          wheelWidth: 8,
          wheelDiameter: 200,
          wheelSquareBorderRadius: 12,
          color: state.currentColor,
          onColorChanged: (Color color) => {
            ref.read(colorsListPageProvider.notifier).setColor(
                  color: color,
                ),
          },
          onColorChangeEnd: (Color color) => {
            print(color),
            //ref.read(colorsListPageProvider.notifier).setColor(color: color),
          },
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 320,
          ),
          child: ClipRRect(
            borderRadius: kMinimumRadius,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 2),
              decoration: const BoxDecoration(color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: kMinimumRadius,
                    child: Container(
                      height: 50,
                      width: 50,
                      color: state.currentColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      print(state.currentColor.value);
                      ref
                          .read(colorsListPageProvider.notifier)
                          .addColor(color: state.currentColor);
                    },
                    child: const Text('Добавить новый цвет'),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        state.colorsList.isEmpty
            ? const SizedBox()
            : Expanded(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 320),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6,
                      crossAxisSpacing: 2.0,
                      mainAxisSpacing: 2.0,
                    ),
                    itemCount: state.colorsList.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: ClipRRect(
                              borderRadius: kMinimumRadius,
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    print(state.colorsList[index].colorId);
                                  },
                                  child: Ink(
                                    color: state.colorsList[index].color,
                                    child: const SizedBox(
                                      height: 45,
                                      width: 45,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: kMinimumRadius,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  ref
                                      .read(colorsListPageProvider.notifier)
                                      .deleteColor(
                                        id: state.colorsList[index].colorId,
                                      );
                                },
                                child: Ink(
                                  color: Colors.red,
                                  child: const SizedBox(
                                    height: 16,
                                    width: 16,
                                    child: Icon(
                                      Icons.delete,
                                      size: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
      ],
    );
  }
}
