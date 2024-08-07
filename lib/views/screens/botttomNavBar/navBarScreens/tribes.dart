import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controlls/controller.dart';
import '../../../../controlls/searchcontroll.dart';
import '../../../search.dart/searchdelegate.dart';
//import '../../detailpage.dart';

class TribesPage extends StatefulWidget {
  const TribesPage({super.key});

  @override
  State<TribesPage> createState() => _TribesPageState();
}

class _TribesPageState extends State<TribesPage> {
  Controller controll = Get.put(Controller());
  final SearchControll controller = Get.put(SearchControll());

  @override
  void initState() {
    super.initState();
    controll.parseJsonTribes(); // Load data on initialization
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tribes of Nigeria"),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: controll.parseJsonTribes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final parsedData = snapshot.data;
            return ListView.builder(
              itemCount: parsedData!.length,
              itemBuilder: (context, index) {
                final key = parsedData.keys.toList()[0];
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
                          final index = item['Index']?.toString();
                          final state = item['State']?.toString();
                          final tribe = item['Tribes'];

                          return ExpansionTile(
                            shape: const Border(),
                            leading:
                                Text(index ?? 'error occurered in tribe.json'),
                            title:
                                Text(state ?? 'error occurered in tribe.json'),
                            children: [
                              GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        3, // number of items in each row
                                    mainAxisSpacing:
                                        4.0, // spacing between rows
                                    // crossAxisSpacing: 2.0,
                                    childAspectRatio: (1 / 0.36),
// spacing between columns
                                  ),
                                  itemCount: tribe.length,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Wrap(children: [
                                      InputChip(
                                          isEnabled: false,
                                          label: Text(
                                            tribe[index],
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
