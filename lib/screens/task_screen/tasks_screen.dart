import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/screens/hub_screen/hub_screen.dart';

class TaskScreenConsumer extends ConsumerWidget {
  final Widget child;
  const TaskScreenConsumer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: child,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          ref.read(providerOfMessages).sink.add('message');
        },
      ),
    );
  }
}
