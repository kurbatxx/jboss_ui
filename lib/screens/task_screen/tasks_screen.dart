import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';



final providerOfMessages = Provider.autoDispose<WebSocketChannel>((ref) {
  WebSocketChannel channel =
      WebSocketChannel.connect(Uri.parse('ws://127.0.0.1:5009/ws'));

  ref.onDispose(() => channel.sink.close());

  channel.sink.add('send_something');
  return channel;
});

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TaskScreenConsumer();
  }
}

class TaskScreenConsumer extends ConsumerWidget {
  const TaskScreenConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(providerOfMessages);

    return Scaffold(
      body: StreamBuilder<String>(
        stream: messages.stream.cast(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            return Center(
              child: Text(snapshot.data ?? ''),
            );
          }
          return const Center(
            child: Text('There is something wrong!'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(providerOfMessages).sink.add('message');
        },
      ),
    );
  }
}
