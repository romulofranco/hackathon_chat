import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class Watson {
  void getNLUSentiments(String text) async {
    var queryParameters = {
      'version': '2018-11-16',
      'text': text,
      'features': 'keywords,entities',
      'entities.emotion': 'true',
      'entities.sentiment': 'true',
      'keywords.emotion': 'true',
      'keywords.sentiment': 'true',
    };

    String apiKey = 'apikey';
    String password = 'oXJJES7ym2VT01RBWVUgCiRM6Ci0vTqQbt3UeU9Q92uP';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$apiKey:$password'));
    print(basicAuth);

    print(queryParameters);

    var uri = Uri.https('gateway.watsonplatform.net',
        '/natural-language-understanding/api/v1/analyze', queryParameters);
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: basicAuth,
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    print(response.statusCode);
    print(response.body);
  }
}
