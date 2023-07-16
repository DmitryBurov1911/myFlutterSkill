import 'package:dio/dio.dart';

final dio = Dio();

Future<String> getHttp(String town) async {
  try {
    final response = await dio.get(
        "https://min-api.cryptocompare.com/data/price?fsym=$town&tsyms=USD");
    final getUSD = response.data["USD"];
    return getUSD.toString();
  } catch(e) {
    return e.toString();
  }
}