import 'package:jboss_ui/objectbox.g.dart';

class ObjectBox {
  late final Store store;

  ObjectBox._create(this.store) {}

  static Future<ObjectBox> create() async {
    final store = openStore(directory: 'D:/Code/BD');
    return ObjectBox._create(store);
  }
}
