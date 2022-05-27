import 'dart:math';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/provider/search_page_providers.dart';
import 'package:jboss_ui/screens/register_device_page/register_device_page.dart';
import 'package:jboss_ui/screens/search_page/search_page.dart';
import 'package:jboss_ui/screens/settings_page/settings_page.dart';
import 'package:jboss_ui/utils/bitsdojo.dart';
import 'package:jboss_ui/utils/constant.dart';
import 'package:jboss_ui/utils/dev_log.dart';

final navBarPositionProvider = StateProvider((ref) => 0);

enum NavBarOptions {
  search(
    icon: Icons.search,
    screen: SearchPage(),
  ),
  history(
    icon: Icons.analytics_outlined,
    screen: ClearScreenTwo(),
  ),
  registerDevice(
    icon: Icons.devices_other_rounded,
    screen: RegisterDevicePage(),
  ),
  setting(
    icon: Icons.settings,
    screen: SettingsPage(),
  );

  final IconData icon;
  final Widget screen;
  const NavBarOptions({
    required this.icon,
    required this.screen,
  });
}

class HubScreen extends StatelessWidget {
  const HubScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const BitsDojoTitleBar(),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: kTabBarHeight),
            child: Row(
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: NavBarSwithcer(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 2, 4, 2),
                  child: ClipRRect(
                    borderRadius: kMinimumRadius,
                    child: Container(
                      color: Colors.red,
                      width: kTabBarHeight,
                      child: const LogoutConsumerButton(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: NavBarScreen(),
          )
        ],
      ),
    );
  }
}

class NavBarSwithcer extends ConsumerWidget {
  const NavBarSwithcer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final position = ref.watch(navBarPositionProvider);

    return AnimatedToggleSwitch<int>.size(
      current: position,
      height: kTabSize.height,
      fittingMode: FittingMode.preventHorizontalOverlapping,
      values: Iterable<int>.generate(NavBarOptions.values.length).toList(),
      iconOpacity: 0.6,
      indicatorSize: kTabSize,
      iconAnimationType: AnimationType.onHover,
      indicatorAnimationType: AnimationType.onHover,
      animationDuration: const Duration(milliseconds: 250),
      borderWidth: 0.0,
      indicatorBorderRadius: kMinimumRadius,
      borderRadius: kZeroRadius,
      borderColor: Colors.transparent,
      iconSize: const Size(28, 28),
      selectedIconSize: const Size(32, 32),
      iconBuilder: (position, size) {
        return Icon(
          NavBarOptions.values.elementAt(position).icon,
          size: min(size.width, size.height),
        );
      },
      onChanged: (position) {
        position.log();
        ref.read(navBarPositionProvider.state).state = position;
      },
    );
  }
}

class NavBarScreen extends ConsumerWidget {
  const NavBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final position = ref.watch(navBarPositionProvider);
    return NavBarOptions.values.elementAt(position).screen;
  }
}

class ClearScreenOne extends StatelessWidget {
  const ClearScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Clear screen 1'),
    );
  }
}

class ClearScreenTwo extends StatelessWidget {
  const ClearScreenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Clear screen 2'),
    );
  }
}

class LogoutConsumerButton extends ConsumerWidget {
  const LogoutConsumerButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RawMaterialButton(
      onPressed: () {
        ref.read(searchPageStateProvider.notifier).clearState();
      },
      child: const Icon(Icons.exit_to_app),
    );
  }
}
