import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tribe/views/search.dart/searchdelegate.dart';

import '../../../../controlls/controller.dart';
import '../../../../controlls/searchcontroll.dart';

class OthersUtilitiesPage extends StatefulWidget {
  const OthersUtilitiesPage({super.key});

  @override
  State<OthersUtilitiesPage> createState() => _OthersUtilitiesPageState();
}

class _OthersUtilitiesPageState extends State<OthersUtilitiesPage> {
  Controller controll = Get.put(Controller());
  final SearchControll controller = Get.put(SearchControll());
  @override
  void initState() {
    super.initState();
    controll.parseJsonOthers(); // Load data on initialization
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Geo-Regions in Nigeria"),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: controll.parseJsonOthers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final parsedData = snapshot.data;
            return ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                final key = parsedData!.keys.toList()[1];
                final items = parsedData[key];
                // Access list of items for each key

                return Column(
                  // You can customize the layout
                  children: [
                    Text(key), // Display the top-level key
                    SizedBox(
                      height: 600,
                      child: ListView.builder(
                        shrinkWrap: true, // Avoid unnecessary scrolling
                        // physics:
                        //     const NeverScrollableScrollPhysics(), // Prevent inner scrolling
                        itemCount: items.length,
                        itemBuilder: (context, innerIndex) {
                          final item = items[innerIndex];
                          final regionName = item['region_name']?.toString();
                          final regionStates = item['region_states'];

                          return ExpansionTile(
                            shape: const Border(),
                            title: Text(regionName ?? "error occured"),
                            children: [
                              GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        3, // number of items in each row
                                    mainAxisSpacing:
                                        4.0, // spacing between rows
                                    // crossAxisSpacing: 2.0,
                                    childAspectRatio: (1 / 0.26),
// spacing between columns
                                  ),
                                  itemCount: regionStates.length,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Wrap(children: [
                                      InputChip(
                                          isEnabled: false,
                                          label: Text(
                                            regionStates[index],
                                            overflow: TextOverflow.clip,
                                          )),
                                    ]);
                                  })
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showSearch(context: context, delegate: LGASearchDelegate(controller));
        },
        label: const Text('search'),
        icon: const Icon(Icons.search),
      ),
    );
  }
}
