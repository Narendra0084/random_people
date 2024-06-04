import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_people/View/people_Controller.dart';

class PeopleDashboard extends StatefulWidget {
  const PeopleDashboard({super.key});

  @override
  State<PeopleDashboard> createState() => _PeopleDashboardState();
}

class _PeopleDashboardState extends State<PeopleDashboard> {
  final PeopleController userController = Get.put(PeopleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Users'),
        actions: [
          IconButton(
            icon: Icon(Icons.sort_by_alpha),
            onPressed: () => userController.sortUsers(true),
          ),
          IconButton(
            icon: Icon(Icons.sort_by_alpha_outlined),
            onPressed: () => userController.sortUsers(false),
          ),
          IconButton(
            icon: Icon(Icons.filter_alt),
            onPressed: () => userController.showYoungestUsers(),
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => userController.deleteUser(),
          ),
        ],
      ),
      body: Obx(() {
        if (userController.users.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: userController.users.length,
          itemBuilder: (context, index) {
            var user = userController.users[index];
            return ListTile(
              title: Text('${user.firstName} ${user.lastName}'),
              subtitle: Text('Age: ${user.age}'),
              trailing: Checkbox(
                value: userController.selectedUsers.contains(user),
                onChanged: (value) => userController.toggleUserSelection(user),
              ),
            );
          },
        );
      }),
    );
  }
}
