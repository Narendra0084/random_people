import 'package:random_people/Module/people_objectbox.dart';

abstract class PeopleStorage {
  Future<void> init();
  Future<void> addUser(People user);
  Future<void> addUsers(List<People> users);
  Future<void> deleteUser(People user);
  Future<void> deleteUsers(List<People> users);
  List<People> getUsers();
}
