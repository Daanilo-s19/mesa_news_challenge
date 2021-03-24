import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:mesa_news_challenge/modules/signin/data/models/signin_model.dart';
import 'package:mesa_news_challenge/modules/signup/data/models/signup_model.dart';

class ApiService {
  static final _baseUrl = DotEnv.env['API_BASE_URL'];
  static const API_VERSION = 'v1/client';

  static final Dio _dio = Dio();

  static const Map<String, dynamic> HEADERS = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Connection': 'keep-alive',
    'Accept-Encoding': 'gzip',
  };

  ApiService() {
    _dio.options.headers = _fromStaticHeaders();
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (final Options options) {
        _insertUserTokenIntoHeader(_dio.options.headers);

        return options;
      },
      onError: (final DioError e) async {
        if (e.response == null) {
          //No connection
          final dioError = DioError(
              request: e.request,
              response: Response(data: {
                "message": "Verifique a sua conexão com a internet!"
              }));
          return dioError;
        } else if (e.response.statusCode != 401 &&
            e.response.statusCode != 403) {
          print(e.error);
          return e;
        }
        //LogOut User if Not Authorized

        print('[APIService] - Unauthorized');
      },
    ));
  }
  Map<String, dynamic> _fromStaticHeaders() =>
      Map<String, dynamic>.from(HEADERS);

  void _insertUserTokenIntoHeader(final Map<String, dynamic> headers) {
    //TODO: adicionar authorizaton
    headers['Authorization'] = 'Bearer authToken';
  }

  String _generateURI(final String path, {final Map<String, String> query}) {
    return Uri.https(_baseUrl, "/$API_VERSION/$path", query).toString();
  }

  Future<Response> signinUser(SigninModel user) async {
    print("call api...");
    String uri = _generateURI('/auth/signin');
    return _dio.post(uri, data: user.toJson());
  }

  Future<Response> signupUser(SignupModel user) async {
    print("call api...");
    String uri = _generateURI('auth/signup');
    return _dio.post(uri, data: user.toJson());
  }

  Future<Response> fetchNews() async {
    String uri = _generateURI('/news');
    return _dio.get(uri);
  }

  Future<Response> fetchNewsHighlights() async {
    String uri = _generateURI('/news/highlights');
    return _dio.get(uri);
  }
}
