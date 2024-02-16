class WeatherModel {
  final String cityName;
  final String date;
  final String? image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;

  WeatherModel({
    required this.cityName,
    required this.date,
    this.image,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final location = json['location'];
    final current = json['current'];
    final forecast = json['forecast']['forecastday'][0];

    return WeatherModel(
      cityName: location['name'],
      date: current['last_updated'],
      image: current['condition']['icon'],
      temp: forecast['day']['avgtemp_c'],
      maxTemp: forecast['day']['maxtemp_c'],
      minTemp: forecast['day']['mintemp_c'],
      weatherCondition: forecast['day']['condition']['text'],
    );
  }
}
