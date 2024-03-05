import 'dart:convert';

import 'package:api_del_up_creat/utils/constants/app_contains.dart';
import 'package:http/http.dart' as http;

import '../model/car_model/cars_model.dart';
import '../model/my_response.dart';

class ApiProvider {
  // static Future<MyResponse> getAllData() async {
  //   Uri uri = Uri.https(AppConstants.baseUrl, "/api/v1/products");
  //   try {
  //     http.Response response = await http.get(
  //       uri,
  //       headers: {
  //         "Authorization": "Bearer ${AppConstants.token}",
  //         "Content-Type": "application/json"
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       // return MyResponse(
  //       //     data: (jsonDecode(response.body)["items"] as List?)
  //       //             ?.map((e) => CarsModel.fromJson(e)) ??
  //       //         []);
  //       return MyResponse(
  //         data: (jsonDecode(response.body)["items"] as List?)
  //             ?.map((e) => CarsModel.fromJson(e))
  //             .toList() ??
  //             [],
  //       );
  //     } else {
  //       return MyResponse(
  //         errorText: response.statusCode.toString(),
  //       );
  //     }
  //   } catch (error) {
  //     return MyResponse(errorText: error.toString());
  //   }
  // }
  static Future<MyResponse> getAllData() async {
    Uri uri = Uri.https(AppConstants.baseUrl, "/api/v1/products");
    try {
      http.Response response = await http.get(
        uri,
        headers: {
          "Authorization": "Bearer ${AppConstants.token}",
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        print('status code: ${response.statusCode}');

        return MyResponse(
          data: (jsonDecode(response.body)["items"] as List?)
                  ?.map((e) => CarsModel.fromJson(e))
                  .toList() ??
              [],
        );
      } else {
        print('status code: ${response.statusCode}');
      }
      return MyResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }
}
