import 'package:flutter/material.dart';

import '../exportlinks.dart';

class GroupMemberList extends StatelessWidget {
  const GroupMemberList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColors().bgColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Members'),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => {Get.offAndToNamed('/Groupchatscreen')},
        ),
      ),
      body: SafeArea(
          child: Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () => Get.offAndToNamed('/profile'),
                        child: ListTile(
                          leading: CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT57VjM7RlEX734kqjPeV2BUhWmTtFAbzfSJM2SaQY&s")),
                          title: Text('User $index'),
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: MySizes(context).screenHeight * 0.02,
                      ),
                  itemCount: 10))),
    );
  }
}
