import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '240729411a55042c0295ea0532ce366c';
const openWeatherMapURL = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
      '$openWeatherMapURL?'
          'q=$cityName&'
          'appid=$apiKey&'
          'units=metric'
    );

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getCurrentLocationWeather() async {
    Location location = Location();
    try {
      print('trying to get location');
      await location.getCurrentLocation();
      print('got location data');
    } catch(e)  {
      print(e);
    }

    var weatherData;
    weatherData = getWeatherUsingLocation(location);
    return weatherData;
  }

  Future<dynamic> getLastLocationWeather() async {
    Location location = Location();
    try {
      print('trying to get last location');
      await location.getLastKnownLocation();
      print('got last location data');
    } catch (e) {
      print(e);
    }

    var weatherData;
    weatherData = getWeatherUsingLocation(location);
    return weatherData;
  }

  Future<dynamic> getWeatherUsingLocation(Location location) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?'
            'lat=${location.latitude}&'
            'lon=${location.longitude}&'
            'appid=$apiKey&'
            'units=metric'
    );

    var weatherData;
    
    try {
      print('trying to get weather data');
      weatherData = await networkHelper.getData();
    } catch(e)  {
      print(e);
    }

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp, String cityName) {
    if (temp > 25) {
      return 'It\'s 🍦 time in $cityName';
    } else if (temp > 20) {
      return 'Time for shorts and 👕 in $cityName';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤 in $cityName';
    } else {
      return 'Bring a 🧥 just in case in $cityName';
    }
  }
}
