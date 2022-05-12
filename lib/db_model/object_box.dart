import 'package:jboss_ui/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';

class ObjectBox {
  late final Store store;

  ObjectBox._create(this.store);

  static Future<ObjectBox> create() async {
    final directory = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: '${directory.path}/objectboxBD');
    return ObjectBox._create(store);
  }
}
