import 'package:carpool/View/FriendsList.dart';
import 'package:carpool/View/GroupChatroomScreen.dart';
import 'package:carpool/View/GroupMembersListScreen.dart';
import 'package:carpool/View/createride.dart';
import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mime/mime.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'View/Bookings.dart';
import 'View/ChatRoom.dart';
import 'View/EditProfile.dart';
import 'exportlinks.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting().then((_) => runApp(GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        initialBinding: SplashBinding(),
        getPages: [
          GetPage(name: '/', page: () => Splash(), bindings: [SplashBinding()]),
          GetPage(
              name: '/Login', page: () => Login(), bindings: [LoginBinding()]),
          GetPage(
              name: '/Groupchatscreen',
              page: () => GroupChatScreen(),
              transition: Transition.fade),
          GetPage(
              name: '/EditProfile',
              page: () => EditProfile(),
              transition: Transition.fade),
          GetPage(
              name: '/Bookings',
              page: () => Bookings(),
              transition: Transition.fade),
          GetPage(
              name: '/ChatRoomScreen',
              page: () => ChatRoomScreen(),
              transition: Transition.fade),
          GetPage(
              name: '/FriendsList',
              page: () => FriendsList(),
              transition: Transition.fade),
          GetPage(
              name: '/driverSignup',
              page: () => driverSignup(),
              transition: Transition.fade),
          GetPage(
              name: '/rideSignup',
              page: () => rideSignup(),
              transition: Transition.zoom),
          GetPage(
              name: '/Home',
              page: () => HomeScreen(),
              transition: Transition.zoom),
          GetPage(
              name: '/BookRide',
              page: () => PreBookRideScreen(),
              transition: Transition.zoom),
          GetPage(
              name: '/BookedRide',
              page: () => const PostBookedRideScreen(),
              transition: Transition.zoom),
          GetPage(
              name: '/FeedBack',
              page: () => const FeedBackScreen(),
              transition: Transition.zoom),
          GetPage(
              name: '/DriverHome',
              page: () => const DriverPickupScreen(),
              transition: Transition.zoom),
          GetPage(
              name: '/CreateRide',
              page: () => const CreateRide(),
              transition: Transition.zoom),
          GetPage(
              name: '/CommunityScreen',
              page: () => CommunityScreen(),
              transition: Transition.zoom),
          GetPage(
              name: '/profile',
              page: () => Profile(),
              transition: Transition.zoom),
          GetPage(
              name: '/GroupMembersList',
              page: () => GroupMemberList(),
              transition: Transition.zoom),
        ],
      )));
}
