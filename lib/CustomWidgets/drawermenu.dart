import 'package:carpool/exportlinks.dart';

Widget cDrawer(context) {
  return Drawer(
    backgroundColor: myColors().bgWhite,
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: myColors().bgColor,
          ),
          child: Column(
            children: [
              SizedBox(
                  height: MySizes(context).screenHeight * 0.15,
                  child: Image(
                    image: AssetImage('assets/images/logo.jpeg'),
                    fit: BoxFit.fill,
                  )),
            ],
          ),
        ),
        ListTile(
          title: Text('Home'),
          onTap: () {
            Get.toNamed('/Home');
            // Add the functionality for Option 1 here
          },
        ),
        ListTile(
          title: Text('Profile'),
          onTap: () {
            Get.toNamed('/profile');
            // Add the functionality for Option 1 here
          },
        ),
        ListTile(
          title: Text('Bookisngs'),
          onTap: () {
            // Add the functionality for Option 2 here
          },
        ),
        ListTile(
          title: Text('Notification'),
          trailing: Switch(
              activeColor: myColors().bgColor,
              inactiveThumbColor: myColors().bgGrey,
              value: true,
              onChanged: (onChanged) => print(onChanged)),
        ),
        ListTile(
          title: Text('Communities'),
          onTap: () {
            Get.toNamed('/CommunityScreen');
            // Add the functionality for Option 2 here
          },
        ),
        ListTile(
          title: Text('Logout'),
          onTap: () {
            Get.toNamed("/Login");
          },
        ),
      ],
    ),
  );
}
