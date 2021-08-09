import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:jboss_ui/util/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/cards_select_dialog.dart';
import '../provider/data_provider.dart';

class SearchAndAddPage extends ConsumerWidget {
  SearchAndAddPage({Key? key}) : super(key: key);
  final _controller = TextEditingController();
  final _searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context, watch) {
    final provider = watch(searchDeleteClientCheckboxProvider);
    final searchDeleteClient = provider.state;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Stack(alignment: AlignmentDirectional.center, children: [
            TextField(
              focusNode: _searchFocusNode,
              autofocus: true,
              controller: _controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(8.0, 16.0, 140.0, 16.0),
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
            children: [
              Checkbox(
                splashRadius: kCheckboxRadius,
                value: searchDeleteClient,
                onChanged: (value) {
                  final provider =
                      context.read(searchDeleteClientCheckboxProvider);
                  provider.state = !provider.state;
                },
              ),
              Text("Показывать выбывших и удаленных")
            ],
          ),
          Divider(),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                ExpandableNotifier(
                  child: ScrollOnExpand(
                    child: Card(
                      //clipBehavior: Clip.antiAlias,
                      child: Expandable(
                        collapsed: CardTileWidget(),
                        expanded: Column(
                          children: [
                            CardTileWidget(),
                            Text("Информация о картах"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CardTileWidget extends StatelessWidget {
  const CardTileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text("85800035"),
      title: Text("Иванова Валерия Антоновна"),
      subtitle: Text(
        "КГУ Средняя общеобразовательная школа-комплекс эстетического № 8",
        style: TextStyle(fontSize: 12.0),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("50000 тг."),
          SizedBox(
            width: 5,
          ),
          Text("Пед. состав"),
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
