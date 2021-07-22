import 'package:flutter/material.dart';
import 'package:jboss_ui/util/constant.dart';

class SearchAndAddPage extends StatelessWidget {
  SearchAndAddPage({Key? key}) : super(key: key);
  final _controller = TextEditingController();
  final _searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
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
                    //padding: EdgeInsets.all(10),
                    shape: const CircleBorder(),
                  ),
                  //icon: Icon(Icons.clear, color: Colors.white),
                  //child: Text("Найти"),
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
              Checkbox(value: false, onChanged: null),
              Text("Показывать выбывших и удаленных")
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
