// ignore_for_file: file_names, camel_case_types

import 'package:carpool/exportlinks.dart';

import '../CustomWidgets/carousel.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var data;

  final _advancedDrawerController = AdvancedDrawerController();
  @override
  void initState() {
    if (data == null) {
      data = Get.arguments;
    }
    // TODO: implement initState
    super.initState();
  }

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
          title: Text('Hello, ${data[0]['user']['firstName']}'),
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
            child: Stack(
          children: [
            Positioned(
              top: 600.0,
              left: 220.0,
              child: Container(
                height: MySizes(context).screenHeight * 0.2,
                width: MySizes(context).screenWidth * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      opacity: 0.2,
                      image: AssetImage('assets/images/bg.png'),
                      fit: BoxFit.contain),
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: MySizes(context).screenHeight * 0.05,
                ),
                carouselSlider(context),
                SizedBox(
                  height: MySizes(context).screenHeight * 0.1,
                ),
                GestureDetector(
                  onTap: () => {Get.toNamed('/BookRide')},
                  child: Container(
                    decoration: BoxDecoration(
                        color: myColors().bgWhite,
                        border: Border.all(color: myColors().bgColor),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.lightGreen
                                .withOpacity(0.5), // Light green shadow
                            spreadRadius: 3,
                            blurRadius: 7,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    width: MySizes(context).screenWidth * 0.9,
                    height: MySizes(context).screenHeight * 0.2,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 50, left: 15),
                          child: cbgColorTitle(
                              text: "BOOK RIDE", context: context),
                        ),
                        SizedBox(
                            height: MySizes(context).screenHeight * 0.4,
                            width: MySizes(context).screenWidth * 0.4,
                            child: Image(
                                image: AssetImage('assets/images/car.png'))),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MySizes(context).screenHeight * 0.05,
                ),
                GestureDetector(
                  onTap: () => {Get.toNamed('/CommunityScreen')},
                  child: Container(
                    decoration: BoxDecoration(
                        color: myColors().bgWhite,
                        border: Border.all(color: myColors().bgColor),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.lightGreen
                                .withOpacity(0.5), // Light green shadow
                            spreadRadius: 3,
                            blurRadius: 7,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    width: MySizes(context).screenWidth * 0.9,
                    height: MySizes(context).screenHeight * 0.2,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 50, left: 15),
                          child: cbgColorTitle(
                              text: "Communities", context: context),
                        ),
                        SizedBox(
                            height: MySizes(context).screenHeight * 0.3,
                            width: MySizes(context).screenWidth * 0.3,
                            child: Image(
                                image: AssetImage('assets/images/group.jpeg'))),
                      ],
                    ),
                  ),
                ),
                // Container(
                //   height: MySizes(context).screenHeight * 0.2,
                //   width: MySizes(context).screenWidth * 0.8,
                //   decoration: BoxDecoration(
                //       image: DecorationImage(
                //           image: AssetImage('assets/images/car.png')),
                //       // color: myColors().bgColor,
                //       borderRadius: BorderRadius.all(Radius.circular(25.0))),
                //   child: cTitle(text: "Book Ride", context: context),
                // ),
              ],
            ),
          ],
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
                  title: Text('Profile'),
                  onTap: () {
                    Get.toNamed('/profile', arguments: [data]);
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
