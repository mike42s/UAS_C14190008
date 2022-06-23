import 'class.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Services {
  Future<List<pegawai>> get_pegawai() async {
    final response = await http.get(
        Uri.parse('https://api-berita-indonesia.vercel.app/cnbc/terbaru/'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data']['posts'];
      return jsonResponse.map((data) => pegawai.fromJson(data)).toList();
    } else {
      throw Exception('Fail to Load Data');
    }
  }
}
