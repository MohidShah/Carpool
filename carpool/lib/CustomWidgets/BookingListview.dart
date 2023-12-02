import '../exportlinks.dart';

Widget BookingListView({itemCount, bookingID, bookingTime, driverName}) {
  return ListView.builder(
    itemCount: itemCount,
    itemBuilder: (context, index) {
      return Card(
        child: ListTile(
          title: Text(
              'Booking ID: ${bookingID == null ? index * 100 / 0.5 : bookingID}'),
          subtitle: Text(
              'Time: ${bookingTime == null ? DateTime.now() : bookingTime}\nDriver Name: ${driverName == null ? "Sheraz" : driverName}'),
        ),
      );
    },
  );
}
