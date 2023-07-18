import 'package:dio/dio.dart';

final dio = Dio();

Future<String> getHttp(String town) async {
    const appid = "66890adabb2e91b0425812172b39d5f4";

    final response = await dio.get(
        "https://samples.openweathermap.org/data/2.5/weather?q=$town&appid=$appid");
    final getTemp = response.data['main']['temp'];
    return getTemp.toString();
}