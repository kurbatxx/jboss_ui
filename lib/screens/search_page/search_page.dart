import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:jboss_ui/models/card_status.dart';
import 'package:jboss_ui/models/search/search_response.dart';
import 'package:jboss_ui/models/search/search_request.dart';
import 'package:jboss_ui/provider/search_page_providers.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jboss_ui/utils/secure.dart';
import 'package:jboss_ui/widgets/cards_select_dialog.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        //: MainAxisSize.min,
        children: [
          SearchFormWidget(),
          const SizedBox(height: 2),
          const DeletePersonSwitcherWidget(),
          const Divider(),
          const Expanded(
            child: NewSearchResultWidget(),
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
    final listSchoolClient = ref.watch(listSchoolClientProvider);
    final counter = ref.read(paginationCounterProvider);
    final limiter = ref.read(paginationLimiterProvider);

    return searchState.when(
      initial: () =>
          const Center(child: Text('Результаты поиска появятся здесь')),
      data: () {
        return ListView.builder(
            shrinkWrap: true,
            itemCount: listSchoolClient.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == listSchoolClient.length - 5 && counter < limiter) {
                ref.watch(searchProvider.notifier).getNextPageResult(
                      ref: ref,
                      context: context,
                      searchRequest: SearchRequest(
                          id: 0,
                          request: ref.read(formSearchControllerProvider).text,
                          schoolId: 0,
                          cards: ref.read(selectCardStatusProvider),
                          page: counter + 1,
                          showDelete: ref.read(deletePersonSwitcherProvider)),
                    );
              }
              if (index == listSchoolClient.length && counter < limiter) {
                return const Center(child: CircularProgressIndicator());
              } else if (index == listSchoolClient.length &&
                  counter == limiter) {
                return Container(
                  color: Colors.amberAccent,
                  height: 1,
                );
              } else {
                Client schoolClient = listSchoolClient[index];
                return ExpandableElement(
                  client: schoolClient,
                );
              }
            });
      },
      noData: () => const Center(
        child: Text('Ничего не найдено'),
      ),
      error: (value) => Center(child: Text(value)),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class SearchFormWidget extends ConsumerWidget {
  SearchFormWidget({Key? key}) : super(key: key);

  final _searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(formSearchControllerProvider);
    return Stack(alignment: AlignmentDirectional.center, children: [
      TextField(
        focusNode: _searchFocusNode,
        autofocus: true,
        controller: ref.watch(formSearchControllerProvider),
        decoration: InputDecoration(
          constraints: const BoxConstraints(maxHeight: 32),
          contentPadding: const EdgeInsets.fromLTRB(8.0, 10.0, 140.0, 10.0),
          hintText: "Введите ФИО или ID",
          isCollapsed: true,
          isDense: true,
          filled: true,
          fillColor: Colors.grey[50],
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(4),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        onSubmitted: (value) {
          ref.watch(formSearchControllerProvider).text == value;
          _searchFocusNode.requestFocus();
          SearchButtonWidget(searchFocusNode: _searchFocusNode)
              .searchMethod(ref, context);
        },
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 24,
            width: 24,
            child: RawMaterialButton(
              onPressed: () {
                ref.read(formSearchControllerProvider).clear();
                _searchFocusNode.requestFocus();
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
          const SizedBox(
            width: 4.0,
          ),
          SearchButtonWidget(searchFocusNode: _searchFocusNode),
        ],
      )
    ]);
  }
}

class SearchButtonWidget extends ConsumerWidget {
  const SearchButtonWidget({
    Key? key,
    required FocusNode searchFocusNode,
  })  : _searchFocusNode = searchFocusNode,
        super(key: key);

  final FocusNode _searchFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(formSearchControllerProvider);
    ref.watch(deletePersonSwitcherProvider);

    return SizedBox(
      height: 32,
      width: 60,
      child: ElevatedButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
        ),
        onPressed: () {
          searchMethod(ref, context);
          _searchFocusNode.requestFocus();
        },
        child: const FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            "Найти",
            overflow: TextOverflow.clip,
          ),
        ),
      ),
    );
  }

  void searchMethod(WidgetRef ref, BuildContext context) {
    ref.watch(searchProvider.notifier).getSearchResult(
          ref: ref,
          context: context,
          searchRequest: SearchRequest(
              id: 0,
              request: ref.read(formSearchControllerProvider).text,
              schoolId: 0,
              cards: ref.read(selectCardStatusProvider),
              page: 1,
              showDelete: ref.read(deletePersonSwitcherProvider)),
        );
  }
}

class DropDownCards extends ConsumerWidget {
  const DropDownCards({Key? key}) : super(key: key);
  static List<CardStatus> items = [
    CardStatus(id: 0, name: "Не имеет значения"),
    CardStatus(id: 1, name: "Только с картами"),
    CardStatus(id: 2, name: "Только без карт")
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selector = ref.watch(selectCardStatusProvider);
    return DropdownButton(
        elevation: 3,
        value: selector,
        items: items.map<DropdownMenuItem<int>>((CardStatus value) {
          return DropdownMenuItem(
            value: value.id,
            child: Text(value.name),
          );
        }).toList(),
        onChanged: (int? value) {
          ref.read(selectCardStatusProvider.state).state = value ?? 0;
        });
  }
}

class DeletePersonSwitcherWidget extends ConsumerWidget {
  const DeletePersonSwitcherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: () {
            print('///');
          },
          child: Row(
            children: [
              Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                splashRadius: 0,
                value: false,
                onChanged: (value) {
                  print(value);
                },
              ),
              const Center(child: Text('Показывать выбывших'))
            ],
          ),
        ),
      ),
    );
    // final deletePersonSwitcherState =
    //     ref.watch(deletePersonSwitcherProvider.state).state;

    // return Material(
    //   type: MaterialType.card,
    //   child: CheckboxListTile(
    //     enableFeedback: true,
    //     contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
    //     controlAffinity: ListTileControlAffinity.leading,
    //     title: const Text("Показывать выбывших и удаленных"),
    //     value: deletePersonSwitcherState,
    //     onChanged: (value) {
    //       final checkboxState = value ?? false != value;
    //       ref.read(deletePersonSwitcherProvider.state).state = checkboxState;
    //       SecureStorage.instance.setShowDeleteState(checkboxState);
    //     },
    //   ),
    // );
  }
}

class ExpandableElement extends StatelessWidget {
  const ExpandableElement({Key? key, required this.client}) : super(key: key);

  final Client client;

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

  final Client client;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GestureDetector(
          child: Text(client.id),
          onTap: () {
            Clipboard.setData(ClipboardData(text: client.id));
          }),
      title: Text('${client.fullname.surname} ${client.fullname.name}'),
      subtitle: Text(
        client.school,
        style: const TextStyle(fontSize: 12.0),
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
                      return const CardsSelectDialog();
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
                      ? Icons.expand_less_rounded
                      : Icons.expand_more_rounded,
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
      height: 50,
      color: Colors.red,
    );
  }
}

class NewSearchResultWidget extends StatelessWidget {
  const NewSearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: ListView(
        children: [
          Container(
            color: Colors.white,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text("12345678"),
                        const Text("Петров Сидор Семёнович"),
                      ],
                    ),
                    Column(
                      children: const [
                        Text(
                          "КГУ «Средняя общеобразовательная школа-комплекс эстетического воспитания №8»",
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 50,
                      width: 100,
                      color: Colors.red,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
