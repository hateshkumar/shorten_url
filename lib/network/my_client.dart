part of 'api.dart';

class MyClient {
  final Map<String, String> defaultHeaders;
  final http.Client _httpClient = http.Client();
  final baseUrl = ENP.baseUrl;

  MyClient({this.defaultHeaders = const {}});

  Future<ApiResponse> _generateResponse(Response res) async {
    ApiModel _model = ApiModel()
      ..data = null
      ..success = false;
    ApiResponse _apiResponse = ApiIntial(_model);

    // ignore: avoid_print
    print("BODY ${res.body}");

    try {
      var data = json.decode(res.body);
      _model.status = data['ok'];
      _model.data = json.decode(res.body);

      if (_model.status) {
        _apiResponse = ApiSuccess(_model);
      } else {
        _model.message = data['error'];
        _apiResponse = ApiFail(_model);
      }
    } on SocketException {
      _model.message =
          "No Internet Available.\nPlease check your internet connection & Try Again!";
      _apiResponse = ApiFail(_model);
    } on FormatException {
      _model.message = "Something went wrong, Please try again.";
      _apiResponse = ApiFail(_model);
    } on HttpException {
      _model.message = "Something went wrong, Please try again.";
      _apiResponse = ApiFail(_model);
    } catch (e) {
      _model.message = "Something went wrong, Our team has been notified";
      _apiResponse = ApiFail(_model);
    }
    return _apiResponse;
  }

  Future<ApiResponse> get(url, {Map<String, String>? headers}) async {
    print("******** (GET REQUEST) ********");

    ApiModel _model = ApiModel()
      ..data = null
      ..success = false;
    ApiResponse _apiResponse = ApiIntial(_model);

    try {
      url = baseUrl + "$url";
      http.Response res = await _httpClient
          .get(Uri.parse(url));

      _apiResponse = await _generateResponse(res);
    } on SocketException {
      _model.message =
          "No Internet Available.\nPlease check your internet connection & Try Again!";
      _apiResponse = ApiFail(_model);
    } on FormatException {
      _model.message = "Something went wrong, Please try again.";
      _apiResponse = ApiFail(_model);
    } on HttpException {
      _model.message = "Something went wrong, Please try again.";
      _apiResponse = ApiFail(_model);
    } catch (e) {
      _model.message = "Something went wrong, Our team has been notified";
      _apiResponse = ApiFail(_model);
    }

    return _apiResponse;
  }


}
