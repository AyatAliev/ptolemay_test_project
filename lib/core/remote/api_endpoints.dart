class ApiEndpoints {
  static const baseUrl = "https://api.openweathermap.org/data/2.5/";
  static const apiKey = "a6617172164eca881577390cab718471";

  /* Home Screen */
  static String getWeather(double lat, double lon) {
    return "weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric";
  }
}
