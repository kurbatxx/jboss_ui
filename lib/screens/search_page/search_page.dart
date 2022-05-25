import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:jboss_ui/utils/constant.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          SearchFormWidget(),
          const SizedBox(height: 2),
          const DeletePersonSwitcherWidget(),
          const SizedBox(height: 4),
          const Expanded(
            child: NewSearchResultWidget(),
          ),
        ],
      ),
    );
  }
}

class SearchFormWidget extends ConsumerWidget {
  SearchFormWidget({Key? key}) : super(key: key);

  final searchController = TextEditingController();
  final _searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(alignment: AlignmentDirectional.center, children: [
      TextField(
        focusNode: _searchFocusNode,
        autofocus: true,
        controller: searchController,
        decoration: InputDecoration(
          constraints: const BoxConstraints(maxHeight: 32),
          contentPadding: const EdgeInsets.fromLTRB(8.0, 10.0, 80, 10.0),
          hintText: "Введите ФИО или ID",
          isCollapsed: true,
          isDense: true,
          filled: true,
          fillColor: Colors.grey[50],
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: kMinimumRadius,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: kMinimumRadius,
          ),
        ),
        onSubmitted: (value) {
          _searchFocusNode.requestFocus();
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
                //ref.read(formSearchControllerProvider).clear();
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
    return SizedBox(
      height: 32,
      width: 50,
      child: ElevatedButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: kMinimumRadius,
          ),
        ),
        onPressed: () {
          //searchMethod(ref, context);
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
}

class DeletePersonSwitcherWidget extends ConsumerWidget {
  const DeletePersonSwitcherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      borderRadius: kMinimumRadius,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Row(
              children: const [
                Icon(Icons.check_box_outline_blank_rounded),
                Center(child: Text('Показывать выбывших'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//SecureStorage.instance.setShowDeleteState(checkboxState);

class NewSearchResultWidget extends StatelessWidget {
  const NewSearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: kMinimumRadius,
      child: Container(
        color: Colors.blueGrey,
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: kMinimumRadius,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: kMinimumHorPadding,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      minimumSize: Size.zero,
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    onPressed: () {},
                                    child: const Text("12345678"),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  const Expanded(
                                      child: FittedBox(
                                          alignment: Alignment.bottomLeft,
                                          fit: BoxFit.scaleDown,
                                          child: Text("Администрация"))),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  const Text("100000 тг."),
                                ],
                              ),
                              const Text(
                                "Петров Сидор Семёнович Ибн Хоттаб",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              const Divider(
                                height: 1,
                              ),
                              Row(
                                children: const [
                                  Expanded(
                                    child: Text(
                                      "КГУ «Средняя общеобразовательная школа-комплекс эстетического воспитания №8»",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: kMinimumRadius,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[50],
                          ),
                          width: 60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Создать\n заявку',
                                  style: TextStyle(
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text('Карты'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
