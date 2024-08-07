import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controlls/controller.dart';
import '../../../../controlls/searchcontroll.dart';
import '../../../search.dart/searchdelegate.dart';
// import '../../../../controlls/searchcontroll.dart';

class PostalZipCodePage extends StatefulWidget {
  const PostalZipCodePage({super.key});

  @override
  State<PostalZipCodePage> createState() => _PostalZipCodePageState();
}

class _PostalZipCodePageState extends State<PostalZipCodePage> {
  Controller controll = Get.put(Controller());
  final SearchControll controller = Get.put(SearchControll());
  @override
  void initState() {
    super.initState();
    controll.parseJsonZipCodes(); // Load data on initialization
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tribes of Nigeria"),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: controll.parseJsonZipCodes(),
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
                          final state = item['state'].toString();
                          final pcode = item['pcode'];

                          return ExpansionTile(
                              shape: const Border(),
                              title: Text(state),
                              children: [
                                Wrap(children: [
                                  InputChip(
                                    isEnabled: false,
                                    label: Text(pcode),
                                    labelStyle: const TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                ]),
                              ]);
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
