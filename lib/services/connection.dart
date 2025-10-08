import 'dart:async';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:crypto/crypto.dart';
// import 'package:convert/convert.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './globals.dart';

class ConnectionService{
  // String username;
  // String password;
  String? token;
  // late SharedPreferences prefs;
  String urlBackend =  dotenv.env['URL_BACKEND'].toString();

  ConnectionService() {
    // _initialize();
  }

  // void _initialize() async {
  //   prefs = await SharedPreferences.getInstance();
  // }

  Future<int> doLogin(username, password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var url = Uri.http(urlBackend, '/api/mobile/v1/auth/login');
      var headers = {'Content-Type': 'application/json'};
      var body = jsonEncode({'email': username, 'password': password});

      // Menambahkan timeout 10 detik
      Response response = await post(url, headers: headers, body: body)
          .timeout(Duration(seconds: 10), onTimeout: () {
        print('Request timeout setelah 10 detik');
        throw TimeoutException('Request login timeout');
      });

      Map dataRes = jsonDecode(response.body);
      if (response.statusCode == 200) {
        token = dataRes['data']['access_token'];
        prefs.setString('access_token', token.toString());
      } else {
        print("Code: ${response.statusCode}");
        print("Message: ${dataRes['message']}");
      }

      return response.statusCode;

    } catch (e) {
      print('Error: $e');
      return -1;
    }
  }

  Future<bool> doLogout() async {
    var response = await backendRequest(method: 'delete', path: '/api/mobile/v1/auth/logout');
    if(response?.statusCode==200){
      print('Success Logout');
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('access_token');
      return true;
    }
    return false;
  }

  Future<Response?> backendRequest({method, path, Object? body, Map<String, String>? params}) async {
    try {
      String clientSecret = dotenv.env['CLIENT_SECRET'].toString();;
      String methodUp = method.toUpperCase();

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? accessToken = prefs.getString('access_token');
      ////////////////////////////////////////////////////////////////////////////
      String bodyJson = (body==null)?"":jsonEncode(body);
      List<int> bytes = utf8.encode(bodyJson);
      Digest sha256Result = sha256.convert(bytes);
      String encryptedString = sha256Result.toString();
      ////////////////////////////////////////////////////////////////////////////
      // String formattedDate = DateFormat("yyyy-MM-ddTHH:mm:ssZ").format(DateTime.now());
      DateTime now = DateTime.now();

      // TODO: Time dynamic fill zona waktu (+07:00)
      String formattedDate = "${DateFormat('yyyy-MM-ddTHH:mm:ss').format(now)}+07:00";
      String stringToSign ="$methodUp:$path:$accessToken:$encryptedString:$formattedDate";
      
      ////////////////////////////////////////////////////////////////////////////
      List<int> keyBytes = utf8.encode(clientSecret);
      List<int> messageBytes = utf8.encode(stringToSign);
      Hmac hmacSha512 = Hmac(sha512, keyBytes); // HMAC-SHA512
      Digest hmacResult = hmacSha512.convert(messageBytes);
      String signatureValue = base64Encode(hmacResult.bytes);
      ////////////////////////////////////////////////////////////////////////////
      var url = Uri.http(urlBackend, path, params);
      // var url = Uri.https('dummyjson.com', '/auth/login');
      // print('Load Token: $access_token');
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
        'X-TIMESTAMP': formattedDate,
        'X-SIGNATURE': signatureValue,
      };
      
      switch (methodUp) {
        case "GET":
          return await get(url, headers: headers).timeout(const Duration(seconds: 10));
        case "POST":
          return await post(url, headers: headers, body: bodyJson).timeout(const Duration(seconds: 10));
        case "PUT":
          return await put(url, headers: headers, body: bodyJson).timeout(const Duration(seconds: 10));
        case "PATCH":
          return await patch(url, headers: headers, body: bodyJson).timeout(const Duration(seconds: 10));
        case "DELETE":
          return await delete(url, headers: headers, body: bodyJson).timeout(const Duration(seconds: 10));
        case "OPTIONS":
          final request = Request('OPTIONS', url);
          request.headers.addAll(headers);
          request.body = jsonEncode(bodyJson);
          final streamedResponse = await request.send().timeout(const Duration(seconds: 10));
          return await Response.fromStream(streamedResponse);
        case "HEAD":
          return await head(url, headers: headers).timeout(const Duration(seconds: 10));
      }
    } catch (e) {
      print('Error: $e');
    }
    return null;
  }

  bool Check(Response? response){
    switch (response?.statusCode) {
      case 200:
        return true;
      case 401:
        ShowToast.error("You dont have access");
        break;
      case null:
        ShowToast.error("Check your connection!");
        break;
      default:
        ShowToast.error("Something wrong");
    }
    return false;
  }

  

}