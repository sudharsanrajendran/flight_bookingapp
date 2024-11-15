import 'package:flight_bookingapp/util_files/providerdata.dart';
import 'package:flight_bookingapp/util_files/ticketscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SeatSelection extends StatefulWidget {
  const SeatSelection({super.key});

  @override
  State<SeatSelection> createState() => _SeatSelectionState();
}

class _SeatSelectionState extends State<SeatSelection> {

  List<List<String>> businessSeats = [
    ["A1", "B1", "C1", "D1", "E1", "F1", "G1"],
    ["A2", "B2", "C2", "D2", "E2", "F2", "G2"],
  ];

  List<List<String>> economySeats = [
    ["A1", "B1", "C1", "D1", "E1", "F1", "G1", "H1"],
    ["A2", "B2", "C2", "D2", "E2", "F2", "G2", "H2"],
    ["A3", "B3", "C3", "D3", "E3", "F3", "G3", "H3"],
    ["A4", "B4", "C4", "D4", "E4", "F4", "G4", "H4"],
  ];

  List<List<bool>> businessSelection = List.generate(2, (_) => List.generate(7, (_) => false));
  List<List<bool>> economySelection = List.generate(4, (_) => List.generate(8, (_) => false));

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<providerdata>(context);
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromRGBO(194, 178, 128, 1.0),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed:(){
                            provider.clearSelections();
                            provider.resetSelections();

                            Navigator.pop(context);
                          }, icon: Icon(Icons.arrow_back_ios_sharp)),
                      Spacer(),
                      Text("Select seat", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.25),
                  child: Row(
                    children: [
                      Consumer<providerdata>(builder: (BuildContext context, providerdata value, Widget? child) {
                        return Text("From: ${provider.fromLocation}",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
                      }),
                      SizedBox(width: 20),
                      Consumer<providerdata>(builder: (BuildContext context, providerdata value, Widget? child) {
                        return Text("TO: ${provider.toLocation}",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
                      })
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.25),
                  child: Row(
                    children: [
                      Container(color: Colors.white, height: 10, width: 10),
                      SizedBox(width: 10),
                      Text("Available", style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 20),
                      Container(color: Colors.green, height: 10, width: 10),
                      SizedBox(width: 10),
                      Text("Selected", style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
            Center(
              child: ClipPath(
                clipper: FlightClipper(),
                child: Container(

                  width: screenWidth * 0.9,
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 100),
                      Container(
                        height: 60,
                        width: 60,
                        child: Image.asset('images/bharath-removebg-preview.png'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(194, 178, 128, 1.0).withOpacity(0.2),
                                borderRadius: BorderRadius.only(topLeft: Radius.elliptical(100, 100)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(194, 178, 128, 1.0).withOpacity(0.2),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(194, 178, 128, 1.0).withOpacity(0.2),
                                borderRadius: BorderRadius.only(topRight: Radius.elliptical(100, 100)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Business Class",
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 170,
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: screenWidth < 600 ? 7 : 4,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: businessSeats.length * businessSeats[0].length,
                            itemBuilder: (context, index) {
                              int row = index ~/ 7;
                              int col = index % 7;
                              String seat = provider.businessSeats[row][col];
                              bool isSelected = provider.businessSelection[row][col];
                              return Consumer<providerdata>(
                                builder: (BuildContext context, value, Widget? child) {
                                  return GestureDetector(
                                    onTap: () => provider.toggleSeatSelection(true, row, col),
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: isSelected ? Colors.green : Colors.pink.withOpacity(0.1),
                                        border: Border.all(color: Colors.black),
                                      ),
                                      child: Text(
                                        seat,
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      Text(
                        "Economy Class",
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                          height: 250,
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 8,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                            ),
                            itemCount: economySeats.length * economySeats[0].length,
                            itemBuilder: (context, index) {
                              int row = index ~/ 8;
                              int col = index % 8;
                              String seat = provider.economySeats[row][col];
                              bool isSelected = provider.economySelection[row][col];
                              return Consumer(
                                builder: (BuildContext context, value, Widget? child) {
                                  return GestureDetector(
                                    onTap: () => provider.toggleSeatSelection(false, row, col),
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: isSelected ? Colors.green : Colors.brown.withOpacity(0.1),
                                          border: Border.all(color: Colors.black),
                                          borderRadius: BorderRadius.circular(6)),
                                      child: Text(
                                        seat,
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),



            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                height: 200,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(194, 178, 128, 1.0).withOpacity(0.7),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 400,
                          child: Text(
                            "Selected Seats: \n${provider.selectedSeats.join(', ')}",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Consumer(
                          builder: (BuildContext context, value, Widget? child) {
                            return  Text(
                            "Amount: \n${provider.totalAmount}",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                            );
                          },

                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Text(
                            "TotalSeats: \n ${provider.totalSelectedSeats}",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 40),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ticketscreen()));
                          },
                          child: Container(
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [Colors.black, Colors.pink]),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Text(
                                  "Place Order",
                                  style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                                )),
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
}

class FlightClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.5, -size.height * 0.1, size.width, size.height * 0.3);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
