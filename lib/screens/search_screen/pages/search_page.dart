import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/provider/new_task_page_provider.dart';
import 'package:jboss_ui/states/search_page_state.dart';
import 'package:jboss_ui/models/search/search_response.dart';
import 'package:jboss_ui/provider/search_page_providers.dart';
import 'package:jboss_ui/screens/search_screen/search_screen.dart';
import 'package:jboss_ui/utils/constant.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchFormWidget(),
        const SizedBox(height: 2),
        const DeletePersonSwitcherWidget(),
        const SizedBox(height: 4),
        const NewSearchResultWidget(),
      ],
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
      TextFormField(
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
        onChanged: (value) {
          ref
              .read(searchPageStateProvider.notifier)
              .setSwitchersSearchString(text: searchController.text);
        },
        onFieldSubmitted: (_) {
          ref
              .read(searchPageStateProvider.notifier)
              .setSearchString(text: searchController.text);
          ref.read(searchPageStateProvider.notifier).search(paginated: false);
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
                searchController.clear();
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
          SizedBox(
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
                ref
                    .read(searchPageStateProvider.notifier)
                    .setSearchString(text: searchController.text);
                ref
                    .read(searchPageStateProvider.notifier)
                    .search(paginated: false);
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
          ),
        ],
      )
    ]);
  }
}

class DeletePersonSwitcherWidget extends ConsumerWidget {
  const DeletePersonSwitcherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showDeleted =
        ref.watch(searchPageStateProvider.select((state) => state.showDeleted));

    return ClipRRect(
      borderRadius: kMinimumRadius,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              ref.read(searchPageStateProvider.notifier).showDeletedtoogle();
            },
            child: Row(
              children: [
                showDeleted
                    ? const Icon(Icons.check_box)
                    : const Icon(Icons.check_box_outline_blank_rounded),
                const Center(
                  child: Text('Показывать выбывших'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NewSearchResultWidget extends ConsumerWidget {
  const NewSearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchPageStateProvider);

    return Expanded(
      child: ClipRRect(
        borderRadius: kMinimumRadius,
        child: Container(
            color: Colors.blueGrey,
            child: showWidget(state) //const SearchResultListWidget(),
            ),
      ),
    );
  }

  showWidget(SearchPageState state) {
    if (state.isInitial) {
      return const Center(
        child: Text("Здесь будут отображаться результаты поиска"),
      );
    } else if (state.isLoading && state.clientList.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state.clientList.isEmpty && !state.isLoading) {
      return const Center(
        child: Text("Ничего не найдено"),
      );
    } else {
      return const SearchResultListWidget();
    }
  }
}

class SearchResultListWidget extends ConsumerWidget {
  const SearchResultListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchPageStateProvider);

    final list = state.clientList;
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        final client = list[index];
        if (index == list.length - 5 && state.pageNumber < state.maxPage) {
          ref.read(searchPageStateProvider.notifier).search(paginated: true);
        }
        return Column(
          children: [
            ClientSearchCardWidget(
              client: client,
            ),
            const SizedBox(
              height: 2,
            ),
            list.length == index + 1 ? showWidget(state) : const SizedBox(),
          ],
        );
      },
    );
  }

  showWidget(SearchPageState state) {
    if (state.isLoading) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 4.0),
        child: SizedBox(
          height: 16.0,
          width: 16.0,
          child: CircularProgressIndicator(),
        ),
      );
    } else if (state.pageNumber == state.maxPage) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 4.0),
        child: Text('Все результаты загружены'),
      );
    } else if (state.error.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Text(state.error),
      );
    } else {
      return const SizedBox();
    }
  }
}

class ClientSearchCardWidget extends StatelessWidget {
  final Client client;

  const ClientSearchCardWidget({
    required this.client,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {},
                            child: Text(client.id),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Expanded(
                              child: FittedBox(
                                  alignment: Alignment.bottomLeft,
                                  fit: BoxFit.scaleDown,
                                  child: Text(client.group))),
                          const SizedBox(
                            width: 4,
                          ),
                          Text("${client.balance} тг."),
                        ],
                      ),
                      Text(
                        "${client.fullName.surname} ${client.fullName.name} ${client.fullName.patronymic}",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      const Divider(
                        height: 1,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              client.school,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
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
                      NewTakButton(
                        client: client,
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
    );
  }
}

class NewTakButton extends ConsumerWidget {
  final Client client;

  const NewTakButton({
    required this.client,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () {
        ref.read(newTaskStateProvider.notifier).init(client: client);
        ref.read(searchNavigationProvider.state).state =
            SearchScreenOption.newDevice;
      },
      child: const Text(
        'Создать\n заявку',
        style: TextStyle(
          fontSize: 11,
        ),
      ),
    );
  }
}
