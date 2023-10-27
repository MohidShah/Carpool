import 'package:carpool/exportlinks.dart';

Widget carouselSlider(context) {
  return SizedBox(
    height: MySizes(context).screenHeight * 0.2,
    width: MySizes(context).screenWidth * 1.0,
    child: CarouselSlider(
      items: [
        // Add your carousel items here
        // Example carousel item
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/img1.jpeg'),
                  fit: BoxFit.fill),
              color: myColors().bgColor,
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
        ),
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/img2.jpeg'),
                  fit: BoxFit.fill),
              color: myColors().bgColor,
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
        ),
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/img3.jpeg'),
                  fit: BoxFit.fill),
              color: myColors().bgColor,
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
        ),
      ],
      options: CarouselOptions(
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        onPageChanged: (index, reason) {
          // Add your onPageChanged logic here
        },
        scrollDirection: Axis.horizontal,
      ),
    ),
  );
}
