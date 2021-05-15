import 'paginated_data_model.dart';

/// Description:
/// Package name: model
/// Project name: network_list_builder
/// Name: bloc_model
/// Author: dammyololade
/// Date: Sat 15 May, 2021
class BlocModel<T extends PaginatedDataModel> {
  T data;
  BlocState state;
  BlocEvent event;

  BlocModel({required this.data, this.state = BlocState.initial,
    this.event = BlocEvent.initial});

}

enum BlocState {
  initial,
  loading,
  dataLoaded,
  error,
  loadingMoreData,
  moreDataLoaded,
  dataRefreshed,
  searchDataReturned,
  searchingData,
}

enum BlocEvent {
  initial,
  fetch,
  refresh,
  loadMore,
  search,
  loadPrevious,
}