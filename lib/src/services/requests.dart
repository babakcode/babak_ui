import 'package:babak_ui/src/constant/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BabakUIRequests {
  final SharedPreferences preferences;
  BabakUIRequests(this.preferences);

  Future<http.Response> _get(
    String url,
  ) async =>
      await http.get(Uri.parse('${BabakUIConstant.baseUrl}/$url'));

  Future<http.Response> _post(String route, Map data) async => await http
      .post(Uri.parse('${BabakUIConstant.baseUrl}/$route'), body: data);

  Future<http.Response> changeable(String tag) async =>
      await _get('changeable/');
}
