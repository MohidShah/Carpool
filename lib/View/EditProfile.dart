// ignore_for_file: file_names

import 'dart:io';

import 'package:carpool/exportlinks.dart';

import '../CustomWidgets/imagePickerUtil.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  String bioText =
      'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters';
  // final controller = Get.put(EditProfileController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1.0,
                height: MediaQuery.of(context).size.height * .3,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 1.0),
                      child: GestureDetector(
                        onTap: () => ImagePickerUtil.pickImage(context),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.25,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://d2x3xhvgiqkx42.cloudfront.net/43cf6303-25b8-4c1e-9942-cb14f8fe611e/caa7233a-a6bf-4482-93a9-62ae52b515cc/2020/06/18/61cf6bfa-3e00-4ebf-ab37-0712958ec0ef/b4ffc494-e590-4d31-9b39-5aa9b3d98312.png')),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: IconButton(
                              onPressed: () => Get.offAndToNamed('/Home'),
                              icon: Icon(Icons.arrow_back),
                              color: myColors().blackTitle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                'EditProfile',
                                style: TextStyle(
                                  color: myColors().blackTitle,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Get.offAllNamed('/profile'),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 350, top: 12),
                              child: Icon(
                                Icons.done,
                                color: myColors().bgGreen,
                                size: 25,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: GestureDetector(
                              onTap: () => ImagePickerUtil.pickImage(context),
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(
                                    'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Wrap(direction: Axis.vertical, children: [
                      SizedBox(
                        width: MySizes(context).screenWidth * 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            cTitle(text: "Mohid", context: context, size: 22.0),
                            Icon(
                              Icons.edit_square,
                              color: myColors().redTitle,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MySizes(context).screenWidth * 0.28,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.location_on, size: 15),
                            cTitle(
                                text: "Punjab, Pakistan",
                                context: context,
                                size: 10.0),
                          ],
                        ),
                      )
                    ])),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 70),
                child: TextField(
                  controller: TextEditingController(text: bioText),
                  onChanged: (newText) {
                    // Update the bioText when the text changes
                    bioText = newText;
                  },
                  style: TextStyle(fontSize: 15),
                  maxLines: null, // Allows multiple lines for editing
                  decoration: InputDecoration(
                    hintText: 'Enter your bio...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 48.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text('Rides'),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '20',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 50,
                        width: 1,
                        color: Colors.black,
                      ),
                      Column(
                        children: [
                          Text('PickUp'),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '200',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 50,
                        width: 1,
                        color: Colors.black,
                      ),
                      Column(
                        children: [
                          Text('Friends'),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '80',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(top: 48.0, left: 20, right: 10),
                  child: Wrap(
                    direction: Axis.vertical,
                    children: [
                      SizedBox(
                        width: MySizes(context).screenWidth * .9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            cTitle(
                                text: "Friends", context: context, size: 20.0),
                            GestureDetector(
                              onTap: () => Get.offAndToNamed('/FriendsList'),
                              child: cTitle(
                                  text: "SeeAll",
                                  context: context,
                                  size: 15.0,
                                  color: myColors().redTitle),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.height * 1.0,
                        height: MediaQuery.of(context).size.height * .1,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: 15,
                          itemBuilder: (context, index) => CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://i.pinimg.com/236x/a8/46/22/a84622e7b2c392b1b46986273efb85e5.jpg'),
                            radius: 30,
                          ),
                          separatorBuilder: ((context, index) => SizedBox(
                                width: MySizes(context).screenWidth * 0.03,
                              )),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
