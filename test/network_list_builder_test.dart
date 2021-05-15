import 'package:flutter_test/flutter_test.dart';
import 'package:network_list_builder/bloc/list_repository.dart';
import 'package:network_list_builder/model/paginated_data_model.dart';
import 'package:network_list_builder/network/network_provider.dart';

import 'package:network_list_builder/network_list_builder.dart';

void main() {
  Uri uri = Uri.https("5e29f02192edd600140de156.mockapi.io", "v1/users");

  test('adds one to input values', () {
    final calculator = Calculator();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
  });

  test('Make a successful api call', () async {
    var provider = NetworkProvider(uri: uri, headers: {});
    var response = await provider.connect();
    expect(response.statusCode, 201);
  });

  test('Convert api response in to paginated data model successfully',
      () async {
    var repository = ListRepository();
    var response = await repository.fetchData(uri, TestModel());
    expect(response is TestModel, true);
  });
}

class TestModel extends PaginatedDataModel<TestUser> {

  @override
  TestModel fromJson(Map<String, dynamic> data) {
    print(data);
    this.data =
        data["data"]["users"].map((e) => TestUser.fromJson(e)).toList();
    super.fromJson(data["data"]);
    return this;
  }
}

class TestUser {
  late int id;
  late String firstName;
  late String avatar;
  late String email;
  late String address;
  late String lastname;

  TestUser.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    firstName = json["firstName"];
    avatar = json["avatar"];
    email = json["email"];
    address = json["address"];
    lastname = json["lastname"];
  }
}
