// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:mobile_app/src/core/utils/http.dart';
import 'package:mobile_app/src/data/enums/local_storage_enum.dart';
import 'package:mobile_app/src/data/models/paginate_param.dart';
import 'package:mobile_app/src/data/models/payload/common_resp.dart';
import 'package:mobile_app/src/data/models/project.dart';
import 'package:mobile_app/src/data/models/user.dart';
import 'package:mobile_app/src/data/providers/storage_provider.dart';

class ProjectService {
  static Uri LIST_URI = Uri.parse('$baseURL/prj/list');
  static Uri CREATE_URI = Uri.parse('$baseURL/prj/create');
  static Uri LIST_USER_URI = Uri.parse('$baseURL/prj/listUsersInProject/');
  static Uri FIND_BY_ID = Uri.parse('$baseURL/prj/find/{id}');
  static Uri RENAME_URI = Uri.parse('$baseURL/prj/rename/');
  static Uri DELETE_URI = Uri.parse('$baseURL/prj/delete/');

  static Future<List<Project>?> list(PaginateParam paginateParam) async {
    print(1);
    var token = await getStringLocalStorge(LocalStorageKey.TOKEN.toString());
    var response = await client.post(LIST_URI,
        headers: authHeader(token!), body: jsonEncode(paginateParam.toJson()));
    if (response.statusCode == 200) {
      var projects = List<Project>.empty();
      var temp = CommonResp.fromJson(json.decode(response.body));
      if (temp.code == "SUCCESS") {
        var temp2 = temp.data! as List;
        projects = (temp2.map((model) => Project.fromJson(model)).toList());
        return projects;
      }
      return List.empty();
    } else {
      // throw Exception('Failed to load data!');
      return List.empty();
    }
  }

  static Future<CommonResp?> delete(Project project) async {
    int? id = project.id;
    var token = await getStringLocalStorge(LocalStorageKey.TOKEN.toString());
    var response = await client.delete(Uri.parse('$baseURL/prj/delete/$id'),
        headers: authHeader(token!));
    if (response.statusCode == 200) {
      var temp = CommonResp.fromJson(json.decode(response.body));
      return temp;
    } else {
      throw Exception('Failed');
    }
  }

  static Future<CommonResp?> rename(Project project, String newName) async {
    int? id = project.id;
    var token = await getStringLocalStorge(LocalStorageKey.TOKEN.toString());
    var response = await client.post(Uri.parse('$baseURL/prj/rename/$id'),
        headers: authHeader(token!), body: jsonEncode(newName));
    if (response.statusCode == 200) {
      var temp = CommonResp.fromJson(json.decode(response.body));
      return temp;
    } else {
      throw Exception('Failed');
    }
  }

  static Future<CommonResp?> create(String newName) async {
    var token = await getStringLocalStorge(LocalStorageKey.TOKEN.toString());
    var response = await client.post(Uri.parse('$baseURL/prj/create'),
        headers: authHeader(token!),
        body: jsonEncode(<String, String>{"name": newName}));
    if (response.statusCode == 200) {
      var temp = CommonResp.fromJson(json.decode(response.body));
      return temp;
    } else {
      throw Exception('Failed');
    }
  }
}