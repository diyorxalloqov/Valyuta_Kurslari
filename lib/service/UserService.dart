import 'package:dio/dio.dart';
import 'package:navigating_routing/core/config/network_response_config.dart';
import 'package:navigating_routing/core/constants/Api.dart';
import 'package:navigating_routing/model/UserModel.dart';

class UserService {
  Future<NetworkResponseConfig> getUser() async {
    try {
      Response response = await Dio().get(Api.api);
      if (response.statusCode == 200) {
        return (NetworkSuccesResponse((response.data as List)
            .map((e) => UserModel.fromJson(e))
            .toList()));
      } else {
        return NetworkErrorResponse(response.statusMessage.toString());
      }
    } on DioError catch (e) {
      return NetworkExeptionResponse(e);
    }
  }
}
