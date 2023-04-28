class HouseRuleViewModel {
  HouseRules? houseRules = HouseRules(name: "", active: true);

  HouseRuleViewModel({required this.houseRules});

  HouseRuleViewModel.fromJson(Map<String, dynamic> json) {
    houseRules = json['house_rules'] != null
        ? HouseRules.fromJson(json['house_rules'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (houseRules != null) {
      data['house_rules'] = houseRules!.toJson();
    }
    return data;
  }
}

class HouseRules {
  late String name;
  late bool active;

  HouseRules({required this.name, required this.active});

  HouseRules.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['active'] = active ? 1 : 0;
    return data;
  }
}
