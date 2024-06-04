import 'package:objectbox/objectbox.dart';
import 'package:random_people/Module/people_objectbox.dart';
import 'objectbox.g.dart'; // Import the generated file

class ObjectBox {
  late final Store store;
  late final Box<People> userBox;

  ObjectBox._create(this.store) {
    userBox = store.box<People>();
  }

  static Future<ObjectBox> create() async {
    final store = await openStore();
    return ObjectBox._create(store);
  }
}
