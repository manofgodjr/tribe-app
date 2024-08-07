import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import '../../../../controlls/controller.dart';
// import '../../../../controlls/searchcontroll.dart';
import '../../../../controlls/controller.dart';
import '../../../../controlls/searchcontroll.dart';
import '../../../search.dart/searchdelegate.dart';
// import '../../../../reuseable/advertcardwidget.dart';

class LgaPages extends StatefulWidget {
  const LgaPages({super.key});

  @override
  State<LgaPages> createState() => _LgaPagesState();
}

final SearchControll controller = Get.put(SearchControll());
Controller controll = Get.put(Controller());

class _LgaPagesState extends State<LgaPages> {
  final String _searchTerm = '';
  // List<dynamic>? _filteredLgaData;
  // Map<String, dynamic>? _allLgaData;

  @override
  void initState() {
    super.initState();
    controll.parseJsonLGA(); // Load data on initialization
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Local Government Areas in Nigeria"),
      ),
      body: Obx(
        () => controll.allLgaData.value == null
            ? const Center(
                child: CircularProgressIndicator()) // Show loading indicator
            : (_searchTerm.isEmpty
                ? ListView.builder(
                    // Display all LGAs if no search term
                    itemCount: controll.allLgaData.value!.length,
                    itemBuilder: (context, index) {
                      final lgstate =
                          controll.allLgaData.value!.keys.toList()[index];
                      final lgas =
                          controll.allLgaData.value!.values.toList()[index];
                      if (lgas.isEmpty) {
                        return const Text('data is empty cant load data');
                      } else {
                        return ExpansionTile(
                          shape: const Border(),
                          title: Text(
                            lgstate,
                            style: const TextStyle(fontSize: 28),
                          ),
                          children: [
                            GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      3, // number of items in each row
                                  mainAxisSpacing: 4.0, // spacing between rows
                                  // crossAxisSpacing: 2.0,
                                  childAspectRatio: (1 / 0.26),
// spacing between columns
                                ),
                                // padding: const EdgeInsets.all(2.0),
                                itemCount: lgas.length,
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Wrap(children: [
                                    InputChip(
                                        labelPadding: const EdgeInsets.all(0),
                                        elevation: 0.0,
                                        isEnabled: false,
                                        label: Text(
                                          lgas[index],
                                          overflow: TextOverflow.clip,
                                        )),
                                  ]);
                                }),
                          ],
                        );
                      }
                    },
                  )
                : ListView.builder(
                    // Display filtered LGAs if search term exists
                    itemCount: controller
                        .searchLGA(_searchTerm)
                        .length, // Use searchLGA function
                    itemBuilder: (context, index) {
                      final lga = controller.searchLGA(_searchTerm)[index];
                      // ... build your list item widget using lga
                      if (lga == null) {
                        final lgstate =
                            controll.allLgaData.value!.keys.toString();
                        return ExpansionTile(
                          title: Text(lgstate),
                          children: [
                            Chip(
                              label: lga.map((lg) => Text(lg.toString())),
                              labelStyle: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                            ),

                            // Wrap(
                            //   children: lgas
                            //       .map((lga) => Chip(label: Text(lga.toString())))
                            //       .toList(),
                            // ),
                          ],
                        );
                      } else {
                        const Text('Error loading search data');
                      }
                      return const Text('error somewhere');
                    },
                  )),
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
// ExpansionTile(
//                   shape: const Border(),

//                   onExpansionChanged: toggleexpansion,
//                   title: Text('$stateName State',
//                       style: const TextStyle(
//                           color: Colors.black,
//                           fontSize: 22,
//                           fontWeight: FontWeight
//                               .w700)), // Display state name (key) as title

//                   children: [
//                     Text(
//                       lgas.join(', '),
//                       style: const TextStyle(color: Colors.black, fontSize: 16),
//                     ),

//                     // Wrap(
//                     //   children: lgas
//                     //       .map((lga) => Chip(label: Text(lga.toString())))
//                     //       .toList(),
//                     // ),
//                   ],
//                 )