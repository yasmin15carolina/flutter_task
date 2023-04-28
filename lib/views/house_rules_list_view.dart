import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_task/models/house_rules_model.dart';
import 'package:flutter_task/stores/house_rules_store.dart';
import 'package:flutter_task/views/house_rules_add_view.dart';
import 'package:flutter_task/widgets/dialogs.dart';

import 'house_rules_update_view.dart';

class HouseRulesListView extends StatefulWidget {
  const HouseRulesListView({super.key});

  @override
  State<HouseRulesListView> createState() => _HouseRulesListViewState();
}

class _HouseRulesListViewState extends State<HouseRulesListView> {
  HouseRulesStore houseRulesStore = HouseRulesStore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "House Rules",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: Center(),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                      builder: (context) => const AddHouseRuleView(),
                    ))
                    .then((value) => houseRulesStore.getHouseRules());
              },
              icon: const Icon(
                Icons.add_circle_outlined,
                color: Colors.white,
              ))
        ],
      ),
      body: FutureBuilder(
        future: houseRulesStore.getHouseRules(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Error fetching data: ${snapshot.error}"),
            );
          }

          return ListView(
            children: [
              Observer(builder: (context) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                      columns: const [
                        DataColumn(label: Text("Id")),
                        DataColumn(label: Text("Name")),
                        DataColumn(label: Text("Edit")),
                        DataColumn(label: Text("")),
                      ],
                      rows: houseRulesStore.houseRules
                          .map((e) => DataRow(
                                  onLongPress: () async {
                                    await houseRulesStore.getHouseRule(e.id!);
                                    Dialogs.showHouseRuleDetails(
                                        context: context,
                                        houseRule: houseRulesStore.houseRule);
                                  },
                                  cells: [
                                    DataCell(Text(e.id.toString())),
                                    DataCell(SizedBox(
                                      width: 100,
                                      child: Text(
                                        e.name.toString(),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )),
                                    DataCell(IconButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                                builder: (context) =>
                                                    UpdateHouseRuleView(
                                                        houseRuleModel: e),
                                              ))
                                              .then((value) => houseRulesStore
                                                  .getHouseRules());
                                        },
                                        icon: Icon(Icons.edit))),
                                    DataCell(IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        Dialogs.showDelete(
                                            context: context,
                                            onConfirm: () async {
                                              await houseRulesStore
                                                  .deleteHouseRules(e.id!);
                                              Dialogs.show(
                                                  context: context,
                                                  title: "Delete",
                                                  content:
                                                      houseRulesStore.message);
                                              await houseRulesStore
                                                  .getHouseRules();
                                            });
                                      },
                                    )),
                                  ]))
                          .toList()),
                );
              }),
              Observer(builder: (context) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all(const CircleBorder())),
                      onPressed: houseRulesStore.page > 1
                          ? () => houseRulesStore.previousPage()
                          : null,
                      child: const Icon(Icons.arrow_back),
                    ),
                    FilledButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all(const CircleBorder())),
                      onPressed: houseRulesStore.responseDataModel.data!
                                  .pagination!.links!.next !=
                              null
                          ? () => houseRulesStore.nextPage()
                          : null,
                      child: const Icon(Icons.arrow_forward),
                    ),
                  ],
                );
              })
            ],
          );
        },
      ),
    );
  }
}
