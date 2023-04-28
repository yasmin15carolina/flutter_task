import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_task/models/house_rules_model.dart';
import 'package:flutter_task/stores/house_rules_store.dart';
import 'package:flutter_task/view-models/house_rule_view_model.dart';
import 'package:flutter_task/widgets/dialogs.dart';
import 'package:flutter_task/widgets/text_input_field.dart';

class UpdateHouseRuleView extends StatefulWidget {
  final HouseRuleModel houseRuleModel;
  const UpdateHouseRuleView({super.key, required this.houseRuleModel});

  @override
  State<UpdateHouseRuleView> createState() => _UpdateHouseRuleViewState();
}

class _UpdateHouseRuleViewState extends State<UpdateHouseRuleView> {
  TextEditingController nameController = TextEditingController(text: "");
  HouseRulesStore houseRulesStore = HouseRulesStore();

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      // Thumb icon when the switch is selected.
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  final _formKey = GlobalKey<FormState>();
  String? validator(String? value) {
    return value!.isEmpty ? "Required Field" : null;
  }

  @override
  void initState() {
    houseRulesStore.setActive(widget.houseRuleModel.active == 1);
    nameController = TextEditingController(text: widget.houseRuleModel.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Update House Rule",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextInputField(
                controller: nameController,
                label: "Name",
                validator: validator,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Active",
                      style: TextStyle(fontSize: 20),
                    ),
                    Observer(builder: (context) {
                      return Switch(
                        thumbIcon: thumbIcon,
                        value: houseRulesStore.active,
                        onChanged: (value) => houseRulesStore.setActive(value),
                      );
                    }),
                  ],
                ),
              ),
              FilledButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (await houseRulesStore.updateHouseRule(
                          HouseRules(
                              name: nameController.text,
                              active: houseRulesStore.active),
                          widget.houseRuleModel.id!)) {
                        Navigator.pop(context);
                        Dialogs.showMessage(
                          context: context,
                          title: "Sucess!",
                          content: houseRulesStore.message,
                        );
                      } else {
                        await Dialogs.showMessage(
                          context: context,
                          title: "Failed",
                          content: houseRulesStore.message,
                        );
                      }
                    }
                  },
                  child: const Text("Update Rule")),
            ],
          ),
        ),
      ),
    );
  }
}
