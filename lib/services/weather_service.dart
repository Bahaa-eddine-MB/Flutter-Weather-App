import 'package:dio/dio.dart';
import 'package:weather_app/Models/WeatherModel.dart';

class WeatherService {
  final String baseURL = "http://api.weatherapi.com/v1";
  final String key = "25fc4df9752f4018aab194158241402";
  final Dio dio;
  WeatherService(this.dio);

  Future<WeatherModel> getCurrentLocation({required String cityName}) async {
    try {
      Response response = await dio.get(
          "$baseURL/forecast.json?key=$key&q=$cityName&days=1&aqi=no&alerts=no");
      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? "Something went wrong !";
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception("Something went wrong !");
    }
  }
}
