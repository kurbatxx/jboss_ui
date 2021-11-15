import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:jboss_ui/model/school_client.dart';
import 'package:jboss_ui/provider/providers.dart';
import 'package:jboss_ui/utils/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jboss_ui/utils/secure.dart';
import '../widgets/cards_select_dialog.dart';

class SearchAndAddPage extends ConsumerWidget {
  SearchAndAddPage({Key? key}) : super(key: key);
  final _controller = TextEditingController();
  final _searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Stack(alignment: AlignmentDirectional.center, children: [
            TextField(
              onSubmitted: (value) {
                _searchFocusNode.requestFocus();
              },
              focusNode: _searchFocusNode,
              autofocus: true,
              controller: _controller,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.fromLTRB(8.0, 16.0, 140.0, 16.0),
                hintText: "Введите ФИО или ID",
                isDense: true,
                filled: true,
                fillColor: kBgColor,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green, width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 28,
                  width: 28,
                  child: RawMaterialButton(
                    onPressed: () {
                      _controller.clear();
                      _searchFocusNode.requestFocus();
                    },
                    elevation: 0,
                    hoverElevation: 0,
                    focusElevation: 0,
                    highlightElevation: 0,
                    fillColor: Colors.red.withOpacity(0.8),
                    child: const Icon(
                      Icons.clear,
                      color: Colors.white,
                      size: 20.0,
                    ),
                    shape: const CircleBorder(),
                  ),
                ),
                const SizedBox(
                  width: 6.0,
                ),
                Container(
                  height: 45,
                  width: 100,
                  child: ElevatedButton.icon(
                    style: TextButton.styleFrom(
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),

                    label: Text("Найти"),
                    icon: Icon(Icons.search, color: Colors.white),
                    onPressed: () {
                      _searchFocusNode.requestFocus();
                    },
                    //child: Text("Найти"),
                  ),
                ),
              ],
            )
          ]),
          Row(
            children: const [
              Text('Наличие карт:'),
              SizedBox(width: 20),
              DropDownCards(),
            ],
          ),
          const DeletePersonSwitcherWidget(),
          const Divider(),
          const Text("Тут будут результаты поиска"),
        ],
      ),
    );
  }
}

class DropDownCards extends StatefulWidget {
  const DropDownCards({Key? key}) : super(key: key);

  @override
  _DropDownCardsState createState() => _DropDownCardsState();
}

class _DropDownCardsState extends State<DropDownCards> {
  final Map<int, String> map2 = {
    0: "Не имеет значения",
    1: "Только с картами",
    2: "Только с картами"
  };
  final items = ['Не имеет значения', 'Только без карт', 'Только с картами'];
  String? _chosenValue = 'Не имеет значения';

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      elevation: 1,
      value: _chosenValue,
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? value) {
        setState(
          () {
            _chosenValue = value;
          },
        );
      },
    );
  }
}

class DeletePersonSwitcherWidget extends ConsumerWidget {
  const DeletePersonSwitcherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deletePersonSwitcherState =
        ref.watch(deletePersonSwitcherProvider.state).state;

    return CheckboxListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
      controlAffinity: ListTileControlAffinity.leading,
      title: const Text("Показывать выбывших и удаленных"),
      onChanged: (value) {
        bool state = value ?? false != value;
        ref.read(deletePersonSwitcherProvider.state).state = state;
        SecureStorage.instance.setShowDeleteState(state);
      },
      value: deletePersonSwitcherState,
    );
  }
}

class CardInfo extends StatelessWidget {
  const CardInfo({
    required this.client,
    Key? key,
  }) : super(key: key);

  final SchoolClient client;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardTileWidget(client: client),
        Divider(),
        Text("Информация о картах"),
      ],
    );
  }
}

class CardTileWidget extends StatelessWidget {
  const CardTileWidget({
    required this.client,
    Key? key,
  }) : super(key: key);

  final SchoolClient client;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(client.id),
      title: Text(client.name),
      subtitle: Text(
        client.school,
        style: TextStyle(fontSize: 12.0),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(client.balance),
          const SizedBox(
            width: 5,
          ),
          Text(client.group),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Material(
              color: Colors.transparent,
              child: IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/rfid.svg",
                  color: Colors.grey,
                  semanticsLabel: 'rfid',
                  width: 20,
                  height: 20,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CardsSelectDialog();
                    },
                  );
                },
              ),
            ),
          ),
          Builder(
            builder: (BuildContext context) {
              final controller =
                  ExpandableController.of(context, required: true)!;
              return IconButton(
                splashRadius: 20,
                onPressed: () {
                  controller.toggle();
                },
                icon: Icon(
                  controller.expanded
                      ? Icons.arrow_upward_outlined
                      : Icons.arrow_downward_outlined,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
