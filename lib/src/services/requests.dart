import 'package:babak_ui/src/constant/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BabakUIRequests {
  final SharedPreferences _preferences;

  BabakUIRequests(this._preferences);

  String? get accountName => _preferences.getString('accountName');

  String? get projectName => _preferences.getString('projectName');

  Future<http.Response> _get(
    String url,
  ) async =>
      await http.get(Uri.parse(
          '${BabakUIConstant.baseUrl}/$accountName/$projectName/$url'));

  Future<http.Response> _post(String route, Map data) async => await http.post(
      Uri.parse('${BabakUIConstant.baseUrl}/$accountName/$projectName/$route'),
      body: data);

  Future<http.Response> changeable(String tag) async =>
      await _get('changeable?tag=$tag');
}
