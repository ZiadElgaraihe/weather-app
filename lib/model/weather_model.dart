class WeatherModel {
  double temp, maxTemp, minTemp;
  String weatherState, city, country;
  String? icon;
  int? dateTime;

  WeatherModel({
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherState,
    required this.city,
    required this.country,
    this.dateTime,
  }) {
    if (weatherState == 'Snow') {
      icon = 'assets/icons/snow.png';
    } else if (weatherState == 'Clouds') {
      icon = 'assets/icons/clouds.png';
    } else if (weatherState == 'Haze' ||
        weatherState == 'Mist' ||
        weatherState == 'Smoke' ||
        weatherState == 'Dust' ||
        weatherState == 'Fog' ||
        weatherState == 'Sand' ||
        weatherState == 'Ash' ||
        weatherState == 'Squall' ||
        weatherState == 'Tornado') {
      icon = 'assets/icons/fog.png';
    } else if (weatherState == 'Rain' || weatherState == 'Drizzle') {
      icon = 'assets/icons/rain.png';
    } else if (weatherState == 'Thunderstorm') {
      icon = 'assets/icons/thunder.png';
    } else {
      icon = 'assets/icons/sun.png';
    }
  }

  factory WeatherModel.fromJson({dynamic data}) {
    return WeatherModel(
      temp: double.parse((data['main']['temp'] - 273.0).toStringAsFixed(1)),
      maxTemp:
          double.parse((data['main']['temp_max'] - 273.0).toStringAsFixed(1)),
      minTemp:
          double.parse((data['main']['temp_min'] - 273.0).toStringAsFixed(1)),
      weatherState: data['weather'][0]['main'],
      city: data['name'],
      country: data['sys']['country'],
    );
  }

  factory WeatherModel.fromJsonList({dynamic data, required int index}) {
    return WeatherModel(
      temp: double.parse(
          (data['list'][index]['main']['temp'] - 273.0).toStringAsFixed(1)),
      maxTemp: double.parse(
          (data['list'][index]['main']['temp_max'] - 273.0).toStringAsFixed(1)),
      minTemp: double.parse(
          (data['list'][index]['main']['temp_min'] - 273.0).toStringAsFixed(1)),
      weatherState: data['list'][index]['weather'][0]['main'],
      city: data['city']['name'],
      country: data['city']['country'],
      dateTime: DateTime.parse(data['list'][index]['dt_txt']).hour,
    );
  }
}
