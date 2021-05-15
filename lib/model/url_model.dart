/// Description:
/// Package name: model
/// Project name: network_list_builder
/// Name: url_model
/// Author: dammyololade
/// Date: Sat 15 May, 2021
class UrlModel {
  /// the url path for the request
  /// such as /user/search
  String path;

  /// The search url, if this is not specified and search action is triggered
  /// the base url will be assumed as the search url too
  ///
  String? searchUrl;

  /// the search key that will be passed to the search endpoint
  ///
  /// e.g searchTerm
  /// ---> https://google.com/search?searchTerm=.....
  String? searchKey;

  /// useful for pagination
  /// initial request will be page = 1
  int page;

  /// For pagination
  /// null if not specified
  int limit;

  /// Request headers
  ///
  Map<String, dynamic>? headers;

  ///
  ///
  Map<String, dynamic> filters;

  UrlModel({
    required this.path,
    this.searchUrl,
    this.searchKey,
    this.page = 1,
    this.limit = 20,
    required this.filters,
  });

  /// build the url into a string
  String toUrl({String? searchTerm}) {
    String url = (searchTerm != null && searchTerm.isNotEmpty)
        ? "$searchUrl?$searchKey=$searchTerm"
        : path;
    if (!url.contains("?")) url += "?";
    if (limit != 0) {
      url += "&page=$page&limit=$limit";
    }
    filters.forEach((key, value) => url += "&$key=$value");
    return url;
  }
}