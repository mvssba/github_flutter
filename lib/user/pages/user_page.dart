import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github/model/user.dart';

import '../user_page_controller.dart';

class UserPage extends GetView<UserPageController> {
  late Future<User> futureUser = controller.getUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Page"),
      ),
      body: Center(
        child: FutureBuilder<User>(
          future: futureUser,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.avatarUrl!);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.getUsers(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
