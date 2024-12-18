import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_part2/res/routes/routes_name.dart';
import 'package:getx_part2/view_model/controllers/user_preferences/user_preferences_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserPreferences user = UserPreferences();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                user.logoutUser();
                Get.offAllNamed(RoutesName.login);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        color: Colors.purpleAccent,
      ),
    );
  }
}
