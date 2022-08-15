import 'package:craneapp/constants/global_variables.dart';
import 'package:craneapp/screens/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/error_handling.dart';
import '../constants/util.dart';

class LogoutService {
  void logout({required BuildContext context}) async {
    try {
      http.Response res = await http.post(Uri.parse('$uri/auth/logout'));
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            try {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setString("x-auth-token", "");
            } catch (error) {
              SharedPreferences.setMockInitialValues({});
            }
            Navigator.pushNamed(context, LoginScreen.routeName);
          });
    } catch (error) {
      showSnackBar(context, error.toString());
    }
  }
}
