import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:getx_part2/data/app_exceptions.dart';
import 'package:getx_part2/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetExceptions("No Internet Exception");
    } on TimeoutException {
      throw TimeoutException('Timeout Occured');
    }
    return responseJson;
  }

  @override
  Future<dynamic> postApi(var data, String url) async {
    dynamic responseJson;
    try {
      var response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetExceptions("No Internet Exception");
    } on TimeoutException {
      throw TimeoutException('Timeout Occured');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 404:
        throw InvalidUrlException("Uril is nor valid");

      default:
        throw CommunicationException(" ${response.statusCode.toString()}");
    }
  }
}
