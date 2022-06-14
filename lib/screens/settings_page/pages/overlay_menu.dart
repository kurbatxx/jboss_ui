import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/provider/device_editor_setting_provider.dart';
import 'package:jboss_ui/utils/constant.dart';

class OverlayMenu {
  static OverlayEntry? overlayEntry;

  static void showMenu({required BuildContext context}) {
    OverlayState? overlayState = Overlay.of(context);
    overlayEntry = OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
              ),
              child: GestureDetector(
                onTap: dismissMenu,
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
            Positioned(
              left: 86,
              top: 187,
              child: ClipRRect(
                borderRadius: kMinimumRadius,
                child: Material(
                  child: Container(
                    width: 258,
                    height: 350,
                    color: Colors.grey[100],
                    child: const JbossDevicesListWidget(),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );

    if (overlayEntry != null) {
      overlayState?.insert(overlayEntry!);
    }
  }

  static void dismissMenu() {
    overlayEntry?.remove();
    overlayEntry = null;
  }
}

class JbossDevicesListWidget extends ConsumerWidget {
  const JbossDevicesListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(deviceEditorScreenProvider);
    return state.jbossDevicesList.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: state.jbossDevicesList.length,
            itemBuilder: (context, index) {
              final jbossDevice = state.jbossDevicesList[index];
              return Padding(
                padding: const EdgeInsets.all(3.0),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      OverlayMenu.dismissMenu();
                    },
                    child: Ink(
                      color: Colors.grey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(jbossDevice.name),
                              ],
                            ),
                          ),
                          Container(
                            height: 2,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
  }
}
