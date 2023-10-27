// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../exportlinks.dart';

class CommunityScreen extends StatelessWidget {
  CommunityScreen({super.key});
  final _advancedDrawerController = AdvancedDrawerController();
  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [myColors().bgColor, Colors.blueGrey.withOpacity(0.2)],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 0.0,
        //   ),
        // ],
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: myColors().bgColor,
          title: const Text('Communities'),
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
        ),
        body: SafeArea(
            child: Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),

            itemBuilder: (context, index) => GestureDetector(
              onTap: () => {
                Get.toNamed('/Groupchatscreen'),
                print("Get.toNamed('/Groupchatscreen')")
              },
              child: SizedBox(
                height: MySizes(context).screenHeight * 0.1,
                child: Card(
                  color: myColors().tealColor,
                  child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Group $index",
                          style: TextStyle(
                              color: myColors().whiteTitle, fontSize: 15),
                        ),
                        Text(
                          "Total Members ${index += 10}",
                          style: TextStyle(
                              color: myColors().whiteTitle, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // separatorBuilder: (context, index) => SizedBox(
            //   height: MySizes(context).screenHeight * 0.01,
            // ),
            itemCount: 10,
          ),
        )),
      ),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 128.0,
                  height: 128.0,
                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 64.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    'https://i.pinimg.com/236x/a8/46/22/a84622e7b2c392b1b46986273efb85e5.jpg',
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
                  title: Text('Bookings'),
                  onTap: () {
                    Get.toNamed('/Bookings');
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
                  title: Text('Setting'),
                  onTap: () {
                    Get.toNamed('/settings');
                    // Add the functionality for Option 2 here
                  },
                ),
                ListTile(
                  title: Text('Logout'),
                  onTap: () {
                    Get.toNamed("/Login");
                  },
                ),
                Spacer(),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 12,
                    color: myColors().blackTitle,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Text('Terms of Service | Privacy Policy'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
