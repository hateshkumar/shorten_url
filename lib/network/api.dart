import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shorten/app_core/app_core.dart';

import 'api_states.dart';

part 'my_client.dart';

class Api {
  Future<ApiResponse> shortenUrl(String? url) async {
    ApiResponse res = await MyClient().get("${ENP.shorten}?${ENP.url}=$url");
    return res;
  }
}
