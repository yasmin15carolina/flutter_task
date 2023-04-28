import 'package:flutter_task/helpers/constants.dart';
import 'package:flutter_task/models/house_rules_model.dart';
import 'package:flutter_task/models/response_data_model.dart';
import 'package:flutter_task/services/house_rules_service.dart';
import 'package:flutter_task/view-models/house_rule_view_model.dart';
import 'package:mobx/mobx.dart';
part 'house_rules_store.g.dart';

class HouseRulesStore = _HouseRulesStoreBase with _$HouseRulesStore;

abstract class _HouseRulesStoreBase with Store {
  @observable
  ObservableList<HouseRuleModel> houseRules = ObservableList<HouseRuleModel>();

  @observable
  HouseRuleModel houseRule = HouseRuleModel();

  @observable
  ResponseDataModel responseDataModel = ResponseDataModel();

  @observable
  int page = 1;

  @observable
  String message = "";

  @observable
  bool active = true;

  @action
  setActive(bool value) {
    active = value;
  }

  @action
  getHouseRules() async {
    try {
      final response = await HouseRulesService.getHouseRules(page: page);
      if (response.statusCode == 200) {
        responseDataModel = ResponseDataModel.fromJson(response.data);
        var data = responseDataModel.data!.entities!;
        houseRules = ObservableList<HouseRuleModel>();
        for (var i = 0; i < data.length; i++) {
          houseRules.add(data[i]);
        }
      }
    } catch (e) {}
  }

  @action
  Future<bool> createHouseRule(HouseRules newHouseRule) async {
    try {
      message = "";
      final response = await HouseRulesService.createHouseRule(
          HouseRuleViewModel(houseRules: newHouseRule));
      if (response.statusCode == 200) {
        message = response.data['message'];
        return true;
      } else {
        message = defaultErrorMessage;
        return false;
      }
    } catch (e) {
      message = defaultErrorMessage;
      return false;
    }
  }

  @action
  Future<bool> updateHouseRule(HouseRules newHouseRule, int id) async {
    try {
      message = "";
      final response = await HouseRulesService.updateHouseRule(
          HouseRuleViewModel(houseRules: newHouseRule), id);
      if (response.statusCode == 200) {
        message = response.data['message'];
        return true;
      } else {
        message = defaultErrorMessage;
        return false;
      }
    } catch (e) {
      message = defaultErrorMessage;
      return false;
    }
  }

  @action
  getHouseRule(int id) async {
    try {
      final response = await HouseRulesService.getHouseRule(id);
      if (response.statusCode == 200) {
        var data = response.data['data'];
        houseRule = HouseRuleModel.fromJson(data);
      }
    } catch (e) {}
  }

  @action
  Future<bool> deleteHouseRules(int id) async {
    try {
      final response = await HouseRulesService.deleteHouseRule(id);

      message = "";

      if (response.statusCode == 200) {
        message = response.data["message"];
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  @action
  nextPage() {
    if (responseDataModel.data!.pagination!.links!.next != null) {
      page++;
      getHouseRules();
    }
  }

  @action
  previousPage() {
    if (page > 1) {
      page--;
      getHouseRules();
    }
  }
}
