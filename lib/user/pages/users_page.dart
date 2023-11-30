import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github/model/user.dart';

import '../user_page_controller.dart';

class UsersPage extends GetView<UserPageController> {
  late Future<List<User>> futureUsers = controller.getUsers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Page"),
      ),
      body: Center(
        child: FutureBuilder<List<User>>(
          future: futureUsers,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data![0].avatarUrl!);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
