import 'package:http/http.dart' as http;

import '../model/school_client.dart';

class JbossDataApi {
  static Future<List<SchoolClient>> getSearchResult(String resp) async {
    await Future.delayed(const Duration(seconds: 2));
    final Uri url = Uri.parse("http://127.0.0.1:8000/data/" + resp);
    final response = await http.get(url);
    return schoolClientFromJson(response.body);
  }
}
