import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/provider/device_editor_setting_provider.dart';
import 'package:jboss_ui/utils/constant.dart';

class OverlayMenu {
  static OverlayEntry? overlayEntry;

  static void showMenu({
    required BuildContext context,
    required Size widgetSize,
    required Offset offset,
  }) {
    final freeSpace = MediaQuery.of(context).size.width - widgetSize.width;
    OverlayState? overlayState = Overlay.of(context);
    overlayEntry = OverlayEntry(
      builder: (context) {
        return Stack(
          fit: StackFit.passthrough,
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
              left: offset.dx,
              top: offset.dy + widgetSize.height + 4,
              child: ClipRRect(
                borderRadius: kMinimumRadius,
                child: Container(
                  width: MediaQuery.of(context).size.width - freeSpace,
                  height: 350,
                  color: Colors.grey[200],
                  child: const JbossDevicesListWidget(),
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
        : Padding(
            padding: const EdgeInsets.all(3.0),
            child: ListView.builder(
              itemCount: state.jbossDevicesList.length,
              itemBuilder: (context, index) {
                final jbossDevice = state.jbossDevicesList[index];
                return Column(
                  children: [
                    ClipRRect(
                      borderRadius: kMinimumRadius,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            ref
                                .read(deviceEditorScreenProvider.notifier)
                                .setJbossDevice(position: index);
                            OverlayMenu.dismissMenu();
                          },
                          child: Ink(
                            color: Colors.white,
                            child: SizedBox(
                              height: 30,
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(jbossDevice.name),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    state.jbossDevicesList.length != index
                        ? const SizedBox(
                            height: 2,
                          )
                        : const SizedBox(),
                  ],
                );
              },
            ),
          );
  }
}
