import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task/view-models/house_rule_view_model.dart';
import 'package:flutter_task/widgets/text_input_field.dart';

import '../models/house_rules_model.dart';

class Dialogs {
  static show({String? title, String? content, context}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title!),
          content: Text(content!),
          actions: <Widget>[
            FilledButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static showMessage({String? title, String? content, context}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title!),
          content: Text(content!),
          actions: <Widget>[
            FilledButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static showHouseRuleDetails({required HouseRuleModel houseRule, context}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text(houseRule.name!),
          content: Container(
            height: MediaQuery.of(context).size.height / 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Id: ${houseRule.id}"),
                Text("Name: ${houseRule.name}"),
                Text("Active: ${houseRule.active == 1 ? "yes" : "no"}"),
                Text("Order: ${houseRule.order}"),
              ],
            ),
          ),
          actions: <Widget>[
            FilledButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static showEdit(
      {required TextEditingController movimentacao,
      required TextEditingController valor,
      required bool isFixed,
      required Function onConfirm,
      context}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
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

        return AlertDialog(
          title: const Text("Edit"),
          content: SizedBox(
            height: MediaQuery.of(context).size.height / 4.5,
            child: Column(
              children: [
                TextInputField(
                  controller: movimentacao,
                  label: "Description",
                ),
                TextInputField(
                  controller: valor,
                  label: "Value",
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^\d+\.?\d{0,2}')),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            // define os botões na base do dialogo
            FilledButton(
              child: const Text("Ok"),
              onPressed: () {
                onConfirm();
                Navigator.of(context).pop();
              },
            ),
            FilledButton(
              child: const Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static showDelete({required Function onConfirm, context}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete"),
          content:
              const Text("Are you sure you want to delete this House Rule?"),
          actions: <Widget>[
            FilledButton(
              child: const Text("Yes"),
              onPressed: () {
                onConfirm();
                Navigator.of(context).pop();
              },
            ),
            FilledButton(
              child: const Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
