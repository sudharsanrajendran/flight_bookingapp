import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List product = [];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  child: Image.asset(
                    'images/background2.jpg',
                    fit: BoxFit.cover,
                    width: screenWidth,
                    height: screenHeight * 0.35,  // Adjusted height for responsiveness
                  ),
                ),
                Positioned(
                  bottom: 50,
                  left: 10,
                  child: RichText(
                    text: TextSpan(
                      text: 'Where are you flying to?\n',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: screenWidth * 0.065, // Responsive font size
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: 'Find your destination',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: screenWidth * 0.05, // Responsive font size
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1.5),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.4),
                      spreadRadius: 4,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'From',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          wordSpacing: 1.1,
                          fontSize: 20,
                        ),
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.flight_takeoff_outlined),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.black,
                            thickness: 1,
                            endIndent: 10,
                          ),
                        ),
                        Icon(Icons.swap_vert, color: Colors.black),
                        Expanded(
                          child: Divider(
                            color: Colors.black,
                            thickness: 1,
                            indent: 10,
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'To',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          wordSpacing: 1.1,
                          fontSize: 20,
                        ),
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.flight_land),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1.5),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.4),
                      spreadRadius: 4,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Suggested for you",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.05),
                          ),
                          TextButton.icon(
                            icon: Text(
                              'View All',
                              style: TextStyle(color: Colors.pink.withOpacity(0.5)),
                            ),
                            label: Icon(Icons.arrow_forward, color: Colors.pink),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 300,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          buildTravelCard('images/parisimage.jpg', 'Paris, France', '\$200'),
                          buildTravelCard('images/india.jpg', 'India', '\$200'),
                          buildTravelCard('images/japan.jpg', 'Japan', '\$200'),
                          buildTravelCard('images/america.jpg', 'Switzerland', '\$200'),
                          buildTravelCard('images/africa.jpg', 'Africa', '\$200'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.9), width: 1.5),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.4),
                      spreadRadius: 4,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Upcoming trip",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.05),
                          ),
                          TextButton.icon(
                            icon: Text(
                              'View All',
                              style: TextStyle(color: Colors.pink.withOpacity(0.5)),
                            ),
                            label: Icon(Icons.arrow_forward, color: Colors.pink),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: '24, Oct 9.40\n',
                            style: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.04, fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: 'LAS \n',
                                style: TextStyle(color: Colors.black, fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: 'Las Vegas', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Icon(Icons.flight_rounded),
                        RichText(
                          text: TextSpan(
                            text: '11.40 \n',
                            style: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.04, fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: 'SFO \n',
                                style: TextStyle(color: Colors.black, fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: 'San Francisco', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTravelCard(String image, String location, String price) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      height: 200,
      child: Card(
        elevation: 20,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                image,
                scale: 1.2,
              ),
              Text(
                location,
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Price: $price',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
