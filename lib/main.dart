import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/views/home_view.dart';
import 'package:get/get.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return GetMaterialApp(
              theme: ThemeData(
                  primarySwatch: getThemeColor(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel!
                          .weatherCondition)),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        );
      }),
    );
  }

  MaterialColor getThemeColor(String? condition) {
    if (condition == null) {
      return Colors.blue;
    }
    switch (condition) {
      case "Sunny":
        return Colors.orange;
      case "Clear":
        return Colors.yellow;
      case "Partly cloudy":
        return Colors.yellow;
      case "Cloudy":
        return Colors.grey;
      case "Overcast":
        return Colors.grey;
      case "Mist":
        return Colors.blueGrey;
      case "Patchy rain nearby":
        return Colors.lightBlue;
      case "Patchy snow nearby":
        return Colors.lightBlue;
      case "Patchy sleet nearby":
        return Colors.lightBlue;
      case "Patchy freezing drizzle possible":
        return Colors.lightBlue;
      case "Thundery outbreaks possible":
        return Colors.deepOrange;
      case "Blowing snow":
        return Colors.lightBlue;
      case "Blizzard":
        return Colors.lightBlue;
      case "Fog":
        return Colors.blueGrey;
      case "Freezing fog":
        return Colors.blueGrey;
      case "Patchy light drizzle":
        return Colors.lightBlue;
      case "Light drizzle":
        return Colors.lightBlue;
      case "Freezing drizzle":
        return Colors.lightBlue;
      case "Heavy freezing drizzle":
        return Colors.lightBlue;
      case "Patchy light rain":
        return Colors.lightBlue;
      case "Light rain":
        return Colors.lightBlue;
      case "Moderate rain at times":
        return Colors.lightBlue;
      case "Moderate rain":
        return Colors.lightBlue;
      case "Heavy rain at times":
        return Colors.lightBlue;
      case "Heavy rain":
        return Colors.lightBlue;
      case "Light freezing rain":
        return Colors.lightBlue;
      case "Moderate or heavy freezing rain":
        return Colors.lightBlue;
      case "Light sleet":
        return Colors.lightBlue;
      case "Moderate or heavy sleet":
        return Colors.lightBlue;
      case "Patchy light snow":
        return Colors.lightBlue;
      case "Light snow":
        return Colors.lightBlue;
      case "Patchy moderate snow":
        return Colors.lightBlue;
      case "Moderate snow":
        return Colors.lightBlue;
      case "Patchy heavy snow":
        return Colors.lightBlue;
      case "Heavy snow":
        return Colors.lightBlue;
      case "Ice pellets":
        return Colors.lightBlue;
      case "Moderate or heavy rain shower":
        return Colors.lightBlue;
      case "Torrential rain shower":
        return Colors.lightBlue;
      case "Light sleet showers":
        return Colors.lightBlue;
      case "Moderate or heavy sleet showers":
        return Colors.lightBlue;
      case "Light snow showers":
        return Colors.lightBlue;
      case "Moderate or heavy snow showers":
        return Colors.lightBlue;
      case "Light showers of ice pellets":
        return Colors.lightBlue;
      case "Moderate or heavy showers of ice pellets":
        return Colors.lightBlue;
      case "Patchy light rain with thunder":
        return Colors.deepOrange;
      case "Moderate or heavy rain with thunder":
        return Colors.deepOrange;
      case "Patchy light snow with thunder":
        return Colors.deepOrange;
      case "Moderate or heavy snow with thunder":
        return Colors.deepOrange;
      default:
        return Colors.grey; // Default color if condition doesn't match
    }
  }
}
