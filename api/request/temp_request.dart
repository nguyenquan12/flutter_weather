import 'package:dio/dio.dart';
import 'package:weather/api/dio_client.dart';

class TempRequest {
  late Dio _dio;

  TempRequest() {
    _dio = DioClient.instance.dio;
  }

  // /data/2.5/weather?appid=6e989685791ff3ecfbfc1d3e93298cd7&units=metric&q=Hanoi
  Future tempCityRequest(String cityName) {
    return _dio.get("/data/2.5/weather", queryParameters: {
      "appid": "6e989685791ff3ecfbfc1d3e93298cd7",
      "units": "metric",
      "q": cityName,
    });
  }
}
