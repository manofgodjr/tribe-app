// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tribe/controlls/controller.dart';
// import 'package:tribe/models/lga_model.dart';

import '../../controlls/searchcontroll.dart';

class LGASearchDelegate extends SearchDelegate<String> {
  SearchControll controller = Get.put(SearchControll()); // Access controller
  LGASearchDelegate(this.controller);

  final Controller controll = Get.put(Controller());
  RxList searchResults = RxList();

  @override
  List<Widget> buildActions(BuildContext context) {
    // Add any actions to the search bar (optional)
    return [
      IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          query = ''; // Clear the search query
          close(context, ''); // Close the search delegate
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Add a leading widget to the search bar (optional)
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, ''); // Close the search delegate
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final lgaData = controll.allLgaData.value; // Access data from controller

    if (lgaData == null) {
      // Handle case where data is not yet loaded
      // ... (show loading indicator or error message)
      return const Center(child: CircularProgressIndicator());
    }

    final filteredStates = lgaData.entries.where((entry) =>
        entry.key.toLowerCase().contains(query.toLowerCase()) &
        entry.value.join(', ').toLowerCase().contains(query.toLowerCase()));
    final filteredLGAs = filteredStates.expand((entry) => entry.value).toList();

    return ListView.builder(
      itemCount: filteredLGAs.length,
      itemBuilder: (context, index) {
        final lga = filteredLGAs[index];
        return ListTile(
          title: Text(lga),
          onTap: () {
            close(context, lga); // Close and return the selected LGA
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Text('data');
  }
}
