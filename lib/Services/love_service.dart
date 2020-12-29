import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/love.dart';

Future<Love> calculateLove(String boy, String girl) {
  final Map<String, String> headers = {
    "x-rapidapi-key": "3ce41c9d44msh5cff4cb9c1f3e9dp1f52f8jsn910dd7217a22",
    "x-rapidapi-host": "love-calculator.p.rapidapi.com"
  };
  final String url = "https://love-calculator.p.rapidapi.com/getPercentage?" +
      'fname=' +
      boy +
      '&sname=' +
      girl;
  return http.get(url, headers: headers).then((data) {
    if (data.statusCode == 200) {
      final jsonData = json.decode(data.body);
      return Love.fromJson(jsonData);
    }
  }).catchError((e) {
    print(e.toString());
  });
}
