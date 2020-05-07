import 'package:coronastats2020/models/world_stat.dart';
import 'package:dio/dio.dart';

const String URL =
    "https://coronavirus-monitor.p.rapidapi.com/coronavirus/worldstat.php";

Future<WorldStat> getWorldStatData() async {
  Dio dio = Dio();
  dio.options.headers = {
    'x-rapidapi-host': 'coronavirus-monitor.p.rapidapi.com',
    'x-rapidapi-key': '3df883ab03msh0f3787d1343d06ep123b65jsn1eb03538b84f'
  };
  final response = await dio.get(URL);
  print(response.data);
  return worldStatFromJson(response.data);
}
