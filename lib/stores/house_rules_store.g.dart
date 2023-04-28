// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_rules_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HouseRulesStore on _HouseRulesStoreBase, Store {
  late final _$houseRulesAtom =
      Atom(name: '_HouseRulesStoreBase.houseRules', context: context);

  @override
  ObservableList<HouseRuleModel> get houseRules {
    _$houseRulesAtom.reportRead();
    return super.houseRules;
  }

  @override
  set houseRules(ObservableList<HouseRuleModel> value) {
    _$houseRulesAtom.reportWrite(value, super.houseRules, () {
      super.houseRules = value;
    });
  }

  late final _$houseRuleAtom =
      Atom(name: '_HouseRulesStoreBase.houseRule', context: context);

  @override
  HouseRuleModel get houseRule {
    _$houseRuleAtom.reportRead();
    return super.houseRule;
  }

  @override
  set houseRule(HouseRuleModel value) {
    _$houseRuleAtom.reportWrite(value, super.houseRule, () {
      super.houseRule = value;
    });
  }

  late final _$responseDataModelAtom =
      Atom(name: '_HouseRulesStoreBase.responseDataModel', context: context);

  @override
  ResponseDataModel get responseDataModel {
    _$responseDataModelAtom.reportRead();
    return super.responseDataModel;
  }

  @override
  set responseDataModel(ResponseDataModel value) {
    _$responseDataModelAtom.reportWrite(value, super.responseDataModel, () {
      super.responseDataModel = value;
    });
  }

  late final _$pageAtom =
      Atom(name: '_HouseRulesStoreBase.page', context: context);

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  late final _$messageAtom =
      Atom(name: '_HouseRulesStoreBase.message', context: context);

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  late final _$activeAtom =
      Atom(name: '_HouseRulesStoreBase.active', context: context);

  @override
  bool get active {
    _$activeAtom.reportRead();
    return super.active;
  }

  @override
  set active(bool value) {
    _$activeAtom.reportWrite(value, super.active, () {
      super.active = value;
    });
  }

  late final _$getHouseRulesAsyncAction =
      AsyncAction('_HouseRulesStoreBase.getHouseRules', context: context);

  @override
  Future getHouseRules() {
    return _$getHouseRulesAsyncAction.run(() => super.getHouseRules());
  }

  late final _$createHouseRuleAsyncAction =
      AsyncAction('_HouseRulesStoreBase.createHouseRule', context: context);

  @override
  Future<bool> createHouseRule(HouseRules newHouseRule) {
    return _$createHouseRuleAsyncAction
        .run(() => super.createHouseRule(newHouseRule));
  }

  late final _$getHouseRuleAsyncAction =
      AsyncAction('_HouseRulesStoreBase.getHouseRule', context: context);

  @override
  Future getHouseRule(int id) {
    return _$getHouseRuleAsyncAction.run(() => super.getHouseRule(id));
  }

  late final _$deleteHouseRulesAsyncAction =
      AsyncAction('_HouseRulesStoreBase.deleteHouseRules', context: context);

  @override
  Future<bool> deleteHouseRules(int id) {
    return _$deleteHouseRulesAsyncAction.run(() => super.deleteHouseRules(id));
  }

  late final _$_HouseRulesStoreBaseActionController =
      ActionController(name: '_HouseRulesStoreBase', context: context);

  @override
  dynamic setActive(bool value) {
    final _$actionInfo = _$_HouseRulesStoreBaseActionController.startAction(
        name: '_HouseRulesStoreBase.setActive');
    try {
      return super.setActive(value);
    } finally {
      _$_HouseRulesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic nextPage() {
    final _$actionInfo = _$_HouseRulesStoreBaseActionController.startAction(
        name: '_HouseRulesStoreBase.nextPage');
    try {
      return super.nextPage();
    } finally {
      _$_HouseRulesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic previousPage() {
    final _$actionInfo = _$_HouseRulesStoreBaseActionController.startAction(
        name: '_HouseRulesStoreBase.previousPage');
    try {
      return super.previousPage();
    } finally {
      _$_HouseRulesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
houseRules: ${houseRules},
houseRule: ${houseRule},
responseDataModel: ${responseDataModel},
page: ${page},
message: ${message},
active: ${active}
    ''';
  }
}
