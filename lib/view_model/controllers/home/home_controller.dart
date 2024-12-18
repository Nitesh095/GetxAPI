import 'package:get/get.dart';
import 'package:getx_part2/data/response/status.dart';
import 'package:getx_part2/model/user/user_model.dart';
import 'package:getx_part2/repository/home_repository/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository _homeApi = HomeRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = UserModel().obs;

  void setRxRequestStatus(Status values) => rxRequestStatus.value = values;
  void setUserList(UserModel values) => userList.value = values;

  void userListApi() {
    _homeApi.getData().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stacktrace) {
      setRxRequestStatus(Status.ERROR);
    });
  }
}
