import 'package:getx_part2/data/network/network_api_services.dart';
import 'package:getx_part2/res/app_url/app_url.dart';

class LoginRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(var data) async {
    var response = await _apiServices.postApi(data, AppUrl.loginApi);
    return response;
  }
}
