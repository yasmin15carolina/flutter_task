import 'package:dio/dio.dart';
import 'package:flutter_task/helpers/constants.dart';

import '../helpers/variables.dart';
import '../view-models/house_rule_view_model.dart';

class HouseRulesService {
  static Future<Response> getHouseRules({int page = 1}) {
    const url = "$urlApi/admin/house_rules";
    return dio.get(
      url,
      queryParameters: {"page": page},
      options: Options(
        headers: getHeaders(),
      ),
    );
  }

  static Future<Response> getHouseRule(int id) {
    final url = "$urlApi/admin/house_rules/$id";
    return dio.get(url, options: Options(headers: getHeaders()));
  }

  static Future<Response> createHouseRule(HouseRuleViewModel newRule) {
    const url = "$urlApi/admin/house_rules";
    return dio.post(
      url,
      data: newRule.toJson(),
      options: Options(headers: getHeaders()),
    );
  }

  static Future<Response> updateHouseRule(
      HouseRuleViewModel houseRule, int id) {
    final url = "$urlApi/admin/house_rules/$id";
    return dio.put(
      url,
      data: houseRule.toJson(),
      options: Options(headers: getHeaders()),
    );
  }

  static Future<Response> deleteHouseRule(int id) {
    final url = "$urlApi/admin/house_rules/$id";
    return dio.delete(
      url,
      options: Options(headers: getHeaders()),
    );
  }
}
