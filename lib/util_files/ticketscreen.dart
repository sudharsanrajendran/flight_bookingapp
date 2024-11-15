import 'package:flight_bookingapp/util_files/providerdata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ticketscreen extends StatefulWidget {
  const ticketscreen({super.key});

  @override
  State<ticketscreen> createState() => _ticketscreenState();
}

class _ticketscreenState extends State<ticketscreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<providerdata>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromRGBO(194, 178, 128, 1.0),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: screenHeight * 0.02,
            left: 10,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    provider.resetSelections();
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                SizedBox(width: screenWidth * 0.25),
                Text(
                  "Boarding Pass",
                  style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: Container(
                height: screenHeight * 0.75,
                width: screenWidth * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "From\n",
                              style: TextStyle(color: Colors.grey),
                              children: [
                                TextSpan(
                                  text: '${provider.fromLocation}',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(Icons.flight, color: Colors.grey),
                          RichText(
                            text: TextSpan(
                              text: "To\n",
                              style: TextStyle(color: Colors.grey),
                              children: [
                                TextSpan(
                                  text: '${provider.toLocation}',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(height: screenHeight * 0.02, thickness: 2),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                      child: Text(
                        provider.userInput,
                        style: TextStyle(
                          fontSize: screenWidth * 0.05,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "Flight\n",
                              style: TextStyle(color: Colors.grey),
                              children: [
                                TextSpan(
                                  text: '${provider.flightname}',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: "Terminals\n",
                              style: TextStyle(color: Colors.grey),
                              children: [
                                TextSpan(
                                  text: '${provider.totalSelectedSeats}',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                      child: Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "Gate\n",
                              style: TextStyle(color: Colors.grey),
                              children: [
                                TextSpan(
                                  text: '${provider.flightname}',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          RichText(
                            text: TextSpan(
                              text: "Class\n",
                              style: TextStyle(color: Colors.grey),
                              children: [
                                TextSpan(
                                  text: 'business',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                      child: Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "Date\n",
                              style: TextStyle(color: Colors.grey),
                              children: [
                                TextSpan(
                                  text: '${provider.selectedDate}',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          RichText(
                            text: TextSpan(
                              text: "Passport ID\n",
                              style: TextStyle(color: Colors.grey),
                              children: [
                                TextSpan(
                                  text: '${provider.selectedTime}',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.05),
                      child: Container(
                        height: screenHeight * 0.25,
                        width: screenWidth * 0.8,
                        child: Image.asset('images/barcode2.jpg', scale: 1),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.all(screenWidth * 0.05),
                        child: Container(
                          width: screenWidth * 0.8,
                          height: screenHeight * 0.07,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Colors.black,
                              Colors.pink,
                            ]),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Download ticket",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
