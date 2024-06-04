import 'package:get/get.dart';
import 'package:objectbox/objectbox.dart';
import 'package:random_people/Service/api_service.dart';
import 'package:random_people/Module/objectbox.dart';
import 'package:random_people/Module/objectbox.g.dart';
import 'package:random_people/Service/objectbox_repo.dart';
import 'package:random_people/Module/people_objectbox.dart';
import 'package:random_people/Service/repository.dart';

class PeopleController extends GetxController {
  final users = <People>[].obs;
  final selectedUsers = <People>[].obs;

  late PeopleStorage userStorage;

  @override
  void onInit() {
    super.onInit();
    userStorage = ObjectBoxStorage();
    _initStore();
  }

  Future<void> _initStore() async {
    await userStorage.init();
    fetchAndStoreUsers();
  }

  Future<void> fetchAndStoreUsers() async {
    try {
      var apiService = ApiService();
      var fetchedUsers = await apiService.fetchUsers(10);
      fetchedUsers = fetchedUsers
          .where(
              (user) => user.firstName.isNotEmpty && user.lastName.isNotEmpty)
          .toList();
      await userStorage.addUsers(fetchedUsers);
      users.addAll(fetchedUsers);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch users');
    }
  }

  void sortUsers(bool ascending) {
    users.sort((a, b) => ascending
        ? a.firstName.compareTo(b.firstName)
        : b.firstName.compareTo(a.firstName));
  }

  void showYoungestUsers() {
    users.sort((a, b) => a.age.compareTo(b.age));
    selectedUsers.assignAll(users.take(2));
  }

  void toggleUserSelection(People user) {
    selectedUsers.contains(user)
        ? selectedUsers.remove(user)
        : selectedUsers.add(user);
  }

  void deleteUser() async {
    await userStorage.deleteUsers(selectedUsers);
    users.removeWhere((user) => selectedUsers.contains(user));
    selectedUsers.clear();
  }
}
