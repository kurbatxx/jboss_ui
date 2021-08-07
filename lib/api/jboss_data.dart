import 'package:http/http.dart' as http;

import '../model/school_client.dart';

class JbossDataApi {
  static Future<List<SchoolClient>> getSearchResult() async {
    await Future.delayed(const Duration(seconds: 2));
    final Uri url = Uri.parse(
        "https://run.mocky.io/v3/5f2d3639-3624-4de4-880e-f0eb10a314f3");
    final response = await http.get(url);
    return schoolClientFromJson(response.body);
  }
}
