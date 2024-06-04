import 'package:objectbox/objectbox.dart';
import 'package:random_people/Module/objectbox.dart';
import 'package:random_people/Module/people_objectbox.dart';
import 'package:random_people/Service/repository.dart';

class ObjectBoxStorage implements PeopleStorage {
  late final Store store;
  late final Box<People> userBox;

  @override
  Future<void> init() async {
    final objectBox = await ObjectBox.create();
    store = objectBox.store;
    userBox = store.box<People>();
  }

  @override
  Future<void> addUser(People user) async {
    userBox.put(user);
  }

  @override
  Future<void> addUsers(List<People> users) async {
    userBox.putMany(users);
  }

  @override
  Future<void> deleteUser(People user) async {
    userBox.remove(user.id);
  }

  @override
  Future<void> deleteUsers(List<People> users) async {
    userBox.removeMany(users.map((user) => user.id).toList());
  }

  @override
  List<People> getUsers() {
    return userBox.getAll();
  }
}
