import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:network_list_builder/model/paginated_data_model.dart';
import 'package:network_list_builder/network/network_provider.dart';

/// Description: ${<DESCRIPTION>}
/// Package name: bloc
/// Project name: network_list_builder
/// Name: list_repository
/// Author: dammyololade
/// Date: Sat 15 May, 2021
class ListRepository {

  Future<PaginatedDataModel> fetchData(Uri uri, PaginatedDataModel model,
      {Map<String, dynamic> headers = const {}}) async {
    try {
      var response =
          await NetworkProvider(uri: uri, headers: headers).connect();
      String body = await _readResponse(response);
      return model.fromJson(jsonDecode(body));
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<String> _readResponse(HttpClientResponse response) async{
    final completer = Completer<String>();
    final result = StringBuffer();
    // final contents = StringBuffer();
    // response.transform(utf8.decoder).listen((data) {
    //   contents.write(data);
    // }, onDone: () => completer.complete(contents.toString()));
    // return completer.future;
    await for (var contents in response.transform(Utf8Decoder())) {
      result.write(contents);
    }
    return result.toString();
  }
}
