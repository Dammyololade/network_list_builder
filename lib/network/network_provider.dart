import 'dart:io';

/// Description:
/// Package name: network
/// Project name: network_list_builder
/// Name: network_provider
/// Author: dammyololade
/// Date: Sat 15 May, 2021
class NetworkProvider {

  /// Instance of the default Uri class
  late Uri uri;
  /// Request headers, this will be attached to http request
  late Map<String, dynamic> headers;


  NetworkProvider({required this.uri, required this.headers});

  Future<HttpClientResponse> connect() async {
    var client = new HttpClient();
    var request = await client.getUrl(uri);
    headers.forEach((key, value) {
      request.headers.add(key, value);
    });
    return request.close();
  }
}
