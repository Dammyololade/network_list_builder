
/// Description: An abstract class that holds reference to the data object, to make
/// use of this class, kindly extend it, you can find usage for this in the example folder
/// Package name: model
/// Project name: network_list_builder
/// Name: paginated_data_model
/// Author: dammyololade
/// Date: Sat 15 May
abstract class PaginatedDataModel<T> {
  late int total, currentPage, limit;
  int? nextPage, previousPage, totalPage;
  late List<T> data;
  String? message;
  late bool success;

  PaginatedDataModel<T> fromJson(Map<String, dynamic> data) {
    total = data["total"] ?? this.data.length;
    currentPage = data["current_page"] ?? 1;
    nextPage = data["next_page"] ?? 1;
    previousPage = data["previous_page"] ?? 1;
    totalPage = data["total_page"] ?? 1;
    limit = data["limit"] ?? total;
    if (totalPage == null) {
      totalPage = (total / limit).round();
    }
    return this;
  }
}