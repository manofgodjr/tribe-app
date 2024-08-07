import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tribe/views/screens/botttomNavBar/navBarScreens/others.dart';
import 'package:tribe/views/screens/botttomNavBar/navBarScreens/postal_zip_code.dart';
import 'package:tribe/views/screens/botttomNavBar/navBarScreens/tribes.dart';
import 'package:tribe/views/screens/comingsoonpage.dart';

import '../../reuseable/advertcardwidget.dart';
import '../../reuseable/culturalitemwidget.dart';
import '../../reuseable/eventcardwidget.dart';
import '../../reuseable/iconbuttonwidget.dart';
import 'botttomNavBar/navBarScreens/lga.dart';
import 'settingsscreen.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tribe'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              Get.to(() => const SettingsScreen());
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banner section (replace with your image/video)
            Container(
              height: 200.0,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/african.jpg'), // Replace with your asset
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Welcome section
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.blueGrey.shade100,
              child: Text(
                'Welcome, Back!',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            const SizedBox(height: 10.0),

            // Quick links section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customIconButton(
                  icon: Icons.calendar_today,
                  label: 'Events',
                  onPressed: () {
                    Get.to(() => const ComingSoonPage());
                  },
                ),
                customIconButton(
                  icon: Icons.people,
                  label: 'Members',
                  onPressed: () {
                    Get.to(() => const ComingSoonPage());
                  },
                ),
                customIconButton(
                  icon: Icons.book,
                  label: 'Culture',
                  onPressed: () {
                    Get.to(() => const ComingSoonPage());
                  },
                ),
              ],
            ),
            const SizedBox(height: 20.0),

            // Upcoming events section
            const Text('Upcoming Events'),
            const SizedBox(height: 10.0),
            eventCard(
              title: 'Cultural Festival',
              date: 'Date: 2024-07-04',
            ),
            const SizedBox(height: 10.0),
            eventCard(
              title: 'Tribe Meeting',
              date: 'Date: 2024-07-15',
            ),

            // Cultural highlights section (replace with your data)
            const SizedBox(height: 20.0),
            const SizedBox(height: 10.0),
            GridView.count(
              shrinkWrap: true, // Prevent overflow
              physics:
                  const NeverScrollableScrollPhysics(), // Disable scrolling
              crossAxisCount: 2, // Two items per row
              mainAxisSpacing: 10.0, // Spacing between rows
              crossAxisSpacing: 10.0, // Spacing between columns
              children: [
                culturalHighlightItem(
                  image:
                      'assets/images/heritage.jpg', // Replace with your asset
                  title: 'Tribes in Nigeria',
                  ontap: () {
                    Get.to(() => const TribesPage(), arguments: {
                      "image": 'assets/images/heritage.jpg',
                      "title": "Tribes in Nigeria",
                    });
                  },
                ),
                culturalHighlightItem(
                  image: 'assets/images/lga.jpg', // Replace with your asset
                  title: 'Local Government Areas in Nigeria',
                  ontap: () {
                    Get.to(() => const LgaPages(), arguments: {
                      "image": 'assets/images/lga_s.jpg',
                      "title": "Tribes in Nigeria",
                    });
                  },
                ),
                culturalHighlightItem(
                  image: 'assets/images/pcode.jpg', // Replace with your asset
                  title: 'Nigeria Postal and Zip code',
                  ontap: () {
                    Get.to(() => const PostalZipCodePage());
                  },
                ),
                culturalHighlightItem(
                  image:
                      'assets/images/geo_regions.jpg', // Replace with your asset
                  title: 'Other, Nigeria Utilities',
                  ontap: () {
                    Get.to(() => const OthersUtilitiesPage());
                  },
                ),
              ],
            ),

            // Announcements section (replace with your announcement)
            const SizedBox(height: 20.0),
            const Text(
              'Announcements',
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 10.0),
            Card(
              child: advertCardWidget(
                  title: 'Tribe Gathering on July 20th!',
                  subtitle: 'Join us for a celebration of our culture.'),
            ),

            const SizedBox(height: 20.0), // Add spacing for bottom
          ],
        ),
      ),
    );
  }
}
