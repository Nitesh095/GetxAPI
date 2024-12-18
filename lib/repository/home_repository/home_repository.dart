import 'package:getx_part2/data/network/network_api_services.dart';
import 'package:getx_part2/model/user/user_model.dart';
import 'package:getx_part2/res/app_url/app_url.dart';

class HomeRepository {
  final _apiServices = NetworkApiServices();

  Future<UserModel> getData() async {
    var response = await _apiServices.getApi(AppUrl.userApi);
    return UserModel.fromJson(response);
  }
}
