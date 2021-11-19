import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:jboss_ui/model/school_client.dart';
import 'package:jboss_ui/provider/search_page_providers.dart';
import 'package:jboss_ui/utils/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jboss_ui/utils/secure.dart';
import '../../widgets/cards_select_dialog.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        //: MainAxisSize.min,
        children: [
          SearchFormWidget(),
          Row(
            children: const [
              Text('Наличие карт:'),
              SizedBox(width: 20),
              DropDownCards(),
            ],
          ),
          const DeletePersonSwitcherWidget(),
          const Divider(),
          const Expanded(
            child: SearchResultWidget(),
          ),
        ],
      ),
    );
  }
}

class SearchResultWidget extends ConsumerWidget {
  const SearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchState = ref.watch(searchProvider);
    return searchState.when(
      initial: () =>
          const Center(child: Text('Результаты поиска появятся здесь')),
      data: (listSchoolClient) => ListView.builder(
          shrinkWrap: true,
          itemCount: listSchoolClient.length,
          itemBuilder: (BuildContext context, int index) {
            SchoolClient schoolClient = listSchoolClient[index];
            return ExpandableElement(
              client: schoolClient,
            );
          }),
      error: (value) => Center(child: Text(value)),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class SearchFormWidget extends StatelessWidget {
  SearchFormWidget({Key? key}) : super(key: key);

  final _controller = TextEditingController();
  final _searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.center, children: [
      TextField(
        onSubmitted: (value) {
          _searchFocusNode.requestFocus();
        },
        focusNode: _searchFocusNode,
        autofocus: true,
        controller: _controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(8.0, 16.0, 140.0, 16.0),
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
          SizedBox(
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
          SearchButtonWidget(
              controller: _controller, searchFocusNode: _searchFocusNode),
        ],
      )
    ]);
  }
}

class SearchButtonWidget extends ConsumerWidget {
  const SearchButtonWidget({
    Key? key,
    required TextEditingController controller,
    required FocusNode searchFocusNode,
  })  : _controller = controller,
        _searchFocusNode = searchFocusNode,
        super(key: key);

  final TextEditingController _controller;
  final FocusNode _searchFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
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
        label: const Text("Найти"),
        icon: const Icon(Icons.search, color: Colors.white),
        onPressed: () {
          print(_controller.text);
          ref.watch(searchProvider.notifier).getSearchResult(context: context);
          _searchFocusNode.requestFocus();
        },
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
      elevation: 3,
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

class ExpandableElement extends StatelessWidget {
  const ExpandableElement({Key? key, required this.client}) : super(key: key);

  final SchoolClient client;

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: ScrollOnExpand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            NoExpandedElement(client: client),
            Expandable(
              collapsed: const SizedBox(),
              expanded: const CardsInformation(),
            ),
          ],
        ),
      ),
    );
  }
}

class NoExpandedElement extends StatelessWidget {
  const NoExpandedElement({
    Key? key,
    required this.client,
  }) : super(key: key);

  final SchoolClient client;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(client.id),
      title: Text('${client.name.name} ${client.name.surname}'),
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

class CardsInformation extends StatelessWidget {
  const CardsInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      color: Colors.red,
    );
  }
}

// class NoExpandedElement extends StatelessWidget {
//   const NoExpandedElement({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: <Widget>[
//         Builder(
//           builder: (context) {
//             var controller = ExpandableController.of(context, required: true)!;
//             return TextButton(
//               child: Text(
//                 controller.expanded ? "COLLAPSE" : "EXPAND",
//                 style: Theme.of(context)
//                     .textTheme
//                     .button!
//                     .copyWith(color: Colors.deepPurple),
//               ),
//               onPressed: () {
//                 controller.toggle();
//               },
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
