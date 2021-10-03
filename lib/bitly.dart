import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

class FShort {
  FShort._internal();

  static FShort _instance;

  static FShort get instance => _instance ??= FShort._internal();

  static String _token;

  /// Initital when open app or before generate shorten link
  ///
  /// @param [token] access token to connecting to [Bitly](https://dev.bitly.com/)
  ///
  void setup({@required String token}) {
    _token ??= token;
  }

  /// Generate shorten URL
  ///
  /// @param [url] url that you want to shorten
  ///
  /// Example
  /// ```
  /// try {
  ///     FShort.instance
  ///         .generateShortenURL(url: 'https://www.google.com.vn/')
  ///         .then((value) {
  ///             print("HCCCCCCC ${value}");
  ///          });
  ///     } catch(e) {
  ///          print(e);
  ///     }
  /// ```
  ///
  Future<String> generateShortenURL({
    @required String url,
    String groupId,
  }) async {
    final client = HttpClient();
    final endPoint = Uri.https('api-ssl.bitly.com', '/v4/shorten');

    final response = await client.postUrl(endPoint).then((request) {
      request.headers
        ..set(HttpHeaders.contentTypeHeader, 'application/json')
        ..set(HttpHeaders.authorizationHeader, 'Bearer $_token');

      final body = {
        'long_url': url,
        'domain': 'bit.ly',
        'group_guid': groupId,
      };
      request.add(utf8.encode(json.encode(body)));
      return request.close();
    });

    final responseBody = await response.transform(utf8.decoder).join();
    final responseJson = json.decode(responseBody) as Map<String, dynamic>;
    return responseJson['link'];
  }
}
