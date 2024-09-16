import 'dart:async';

import 'package:dio/dio.dart';
import 'package:weather/base/resource_model.dart';
import 'package:weather/model/weather_model.dart';

import '../api/request/temp_request.dart';

class TempRepository {
  late TempRequest _tempRequest;

  TempRepository(TempRequest tempRequest) {
    _tempRequest = tempRequest;
  }

  Future<ResourceModel<WeatherModel>> getTempCity(String cityName) async {
    Completer<ResourceModel<WeatherModel>> completer = Completer();
    // completer.complete(ResourceModel.loading());
    try {
      Response response = await _tempRequest.tempCityRequest(cityName);
      if (response.statusCode == 200) {
        WeatherModel weatherModel = WeatherModel.fromJson(response.data);
        completer.complete(ResourceModel.success(weatherModel));
      }
    } on DioException catch (error) {
      if (error.response != null) {
        if (error.response!.statusCode == 404) {
          completer.completeError(
              ResourceModel.error(error.response!.data['message']));
        }
      }
    } catch (e) {
      completer.completeError(ResourceModel.error(e.toString()));
    }
    return completer.future;
  }
}
