import '../model/my_response.dart';
import '../network/app_provider.dart';

class CarRepositories {
  Future<MyResponse> getAllCarProducts() => ApiProvider.getAllData();
}