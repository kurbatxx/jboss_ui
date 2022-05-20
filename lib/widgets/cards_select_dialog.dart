import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardsSelectDialog extends StatefulWidget {
  const CardsSelectDialog({Key? key}) : super(key: key);

  @override
  CardsSelectDialogState createState() => CardsSelectDialogState();
}

class CardsSelectDialogState extends State<CardsSelectDialog> {
  List<bool> isSelectedDevice =
      List.generate(3, (int index) => index > 0 ? false : true);

  List<bool> isSelectedColor =
      List.generate(10, (int index) => index > 0 ? false : true);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 28,
                  width: 28,
                  child: RawMaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    elevation: 0,
                    hoverElevation: 0,
                    focusElevation: 0,
                    highlightElevation: 0,
                    fillColor: Colors.red.withOpacity(0.8),
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.clear,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ),
                ),
              ],
            ),
            ToggleButtons(
              onPressed: (int index) {
                setState(() {
                  for (int buttonIndex = 0;
                      buttonIndex < isSelectedDevice.length;
                      buttonIndex++) {
                    if (buttonIndex == index) {
                      isSelectedDevice[buttonIndex] = true;
                    } else {
                      isSelectedDevice[buttonIndex] = false;
                    }
                  }
                });
              },
              isSelected: isSelectedDevice,
              children: const <Widget>[
                Icon(
                  Icons.credit_card,
                  size: 80,
                ),
                Icon(
                  Icons.watch,
                  size: 80,
                ),
                Icon(
                  Icons.label,
                  size: 80,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
              width: 10,
            ),
            isSelectedDevice[1]
                ? ToggleButtons(
                    isSelected: isSelectedColor,
                    onPressed: (int index) {
                      setState(() {
                        for (int colorIndex = 0;
                            colorIndex < isSelectedColor.length;
                            colorIndex++) {
                          if (colorIndex == index) {
                            isSelectedColor[colorIndex] = true;
                          } else {
                            isSelectedColor[colorIndex] = false;
                          }
                        }
                      });
                    },
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        color: Colors.red,
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        color: Colors.green,
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        color: Colors.yellow,
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        color: Colors.black,
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        color: Colors.blue,
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        color: Colors.blue,
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        color: Colors.blue,
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        color: Colors.blue,
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        color: Colors.blue,
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        color: Colors.blue,
                      ),
                    ],
                  )
                : const SizedBox(
                    height: 5,
                    width: 5,
                  ),
            const SizedBox(
              height: 5.0,
            ),
            Row(children: const [
              FreeChecbox(),
              Flexible(
                child: Text("Выдать бесплано"),
              ),
            ]),
            const Text(
              "Активное устройство будет заблокировано!",
              style: TextStyle(color: Colors.red),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Создать заявку"),
            ),
          ],
        ),
      ),
    );
  }
}

class FreeChecbox extends ConsumerWidget {
  const FreeChecbox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Checkbox(
      //splashRadius: kCheckboxRadius,
      value: true,
      onChanged: (value) {},
    );
  }
}
