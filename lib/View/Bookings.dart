import 'package:flutter/material.dart';

import '../CustomWidgets/BookingListview.dart';
import '../exportlinks.dart';

class Bookings extends StatelessWidget {
  const Bookings({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: myColors().bgColor,
          title: Text('Bookings'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Progress'),
              Tab(text: 'Completed'),
              Tab(text: 'Cancelled'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1: Progress
            Center(child: Expanded(child: BookingListView(itemCount: 1))),
            // Tab 2: Completed
            Center(child: Expanded(child: BookingListView(itemCount: 10))),
            // Tab 3: Cancelled
            Center(child: Expanded(child: BookingListView(itemCount: 2))),
          ],
        ),
      ),
    );
  }
}
