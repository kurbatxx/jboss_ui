import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/provider/login_page_providers.dart';
import 'package:jboss_ui/provider/search_page_providers.dart';
import 'package:jboss_ui/screens/search_page/search_page.dart';
import '../../utils/constant.dart';

class HubPage extends StatelessWidget {
  const HubPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: kBgColor, //Colors.transparent,
          toolbarHeight: 40.0,
          flexibleSpace: Padding(
            padding: const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 4.0),
            child: Row(
              children: [
                const Expanded(
                  child: TabBar(
                    indicator: BoxDecoration(
                      color: kTopColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: kTabsRadius,
                        bottomRight: kTabsRadius,
                      ),
                    ),
                    tabs: [
                      Tab(
                        child: Text(
                          "Поиск",
                          style: kTabsTextStyle,
                        ),
                      ),
                      Tab(
                        child: Text(
                          "История заказов",
                          style: kTabsTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                Consumer(builder: (context, WidgetRef ref, _) {
                  return IconButton(
                    padding: const EdgeInsets.all(0.0),
                    hoverColor: Colors.white,
                    splashRadius: 16.0,
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      ref
                          .read(authorizationProvider.notifier)
                          .logout(context, ref);

                      ref.read(searchProvider.notifier).logout();
                      ref.read(formSearchControllerProvider).clear();
                    },
                  );
                }),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
              color: kBgColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: kTopColor,
                    borderRadius: BorderRadius.only(
                      topLeft: kTabsRadius,
                      topRight: kTabsRadius,
                    ),
                  ),
                  child: Container(
                    color: Colors.transparent,
                    child: const SearchPage(),
                  ),
                ),
              ),
            ),
            Container(
              color: kTopColor,
              child: DefaultTabController(
                length: 4,
                child: Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    elevation: 0,
                    backgroundColor: kBgColor,
                    toolbarHeight: 36.0,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
                      child: Theme(
                        data: ThemeData(
                          hoverColor: Colors.transparent,
                        ),
                        child: const TabBar(
                          indicator: BoxDecoration(
                            color: kTopColor,
                            borderRadius: BorderRadius.only(
                              topLeft: kTabsRadius,
                              topRight: kTabsRadius,
                            ),
                          ),
                          tabs: [
                            Tab(
                              child: Text(
                                "All",
                                style: kTabsTextStyle,
                              ),
                            ),
                            Tab(
                              child: Text(
                                "Progress",
                                style: kTabsTextStyle,
                              ),
                            ),
                            Tab(
                              child: Text(
                                "Done",
                                style: kTabsTextStyle,
                              ),
                            ),
                            Tab(
                              child: Text(
                                "Issued",
                                style: kTabsTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  body: Container(
                    color: kBgColor,
                    child: TabBarView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: kTopColor,
                              borderRadius:
                                  BorderRadius.only(topRight: kTabsRadius),
                            ),
                            child: Container(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: kTopColor,
                              borderRadius: BorderRadius.only(
                                topLeft: kTabsRadius,
                                topRight: kTabsRadius,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: kTopColor,
                              borderRadius: BorderRadius.only(
                                topLeft: kTabsRadius,
                                topRight: kTabsRadius,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: kTopColor,
                              borderRadius: BorderRadius.only(
                                topLeft: kTabsRadius,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
