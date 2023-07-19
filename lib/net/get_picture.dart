import 'package:dio/dio.dart';

final dio = Dio();

Future<String> getHttp(String town) async {
    const appid = "956ce7fdb9116350e95b82569906630a";

    final response = await dio.get(
        "https://samples.openweathermap.org/data/2.5/weather?q=$town&appid=$appid");
    final getTemp = response.data['main']['temp'];
    return getTemp.toString();
}