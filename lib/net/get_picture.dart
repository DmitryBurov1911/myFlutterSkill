import 'package:dio/dio.dart';

final dio = Dio();

Future<double> getHttp(String town) async {
  final response = await dio.get(
      "https://min-api.cryptocompare.com/data/price?fsym=$town&tsyms=USD");
  final getUSD = response.data["USD"];

  return getUSD;
}