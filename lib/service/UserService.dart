import 'package:dio/dio.dart';
import 'package:navigating_routing/model/UserModel.dart';

import '../core/constants/Api.dart';

class UserService {
  Future<dynamic> getUser() async {
    try {
      Response response = await Dio().get(Api.api);
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => UserModel.fromJson(e))
            .toList();
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      return e.message.toString();
    }
  }
}
