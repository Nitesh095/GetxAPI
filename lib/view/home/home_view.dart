import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_part2/data/response/status.dart';
import 'package:getx_part2/res/components/custome_card.dart';
import 'package:getx_part2/res/routes/routes_name.dart';
import 'package:getx_part2/view_model/controllers/home/home_controller.dart';
import 'package:getx_part2/view_model/controllers/user_preferences/user_preferences_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserPreferences user = UserPreferences();

  final homeController = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    homeController.userListApi();
  }

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
      body: Obx(
        () {
          switch (homeController.rxRequestStatus.value) {
            case Status.LOADING:
              return const Center(
                child: CircularProgressIndicator(),
              );

            case Status.ERROR:
              return const Center(
                child: Text("Data is not available"),
              );

            case Status.COMPLETED:
              return ListView.builder(
                itemCount: homeController.userList.value.data!.length,
                itemBuilder: (context, index) {
                  return CustomCard(
                    url: homeController.userList.value.data![index].avatar,
                    title: homeController.userList.value.data![index].firstName,
                    subtitle: homeController.userList.value.data![index].email,
                    onTap: () {},
                    isPresent: isPresent(index),
                  );
                },
              );
          }
        },
      ),
    );
  }

  bool isPresent(int index) {
    return index % 2 == 0 ? true : false;
  }
}
