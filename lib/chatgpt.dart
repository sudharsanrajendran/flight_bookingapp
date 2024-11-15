import 'package:flutter/material.dart';

class SeatSelectionScreen extends StatefulWidget {
  @override
  _SeatSelectionScreenState createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  List<List<String>> businessSeats = [
    ['A1', 'B1', 'C1', 'D1'],
    ['A2', 'B2', 'C2', 'D2'],
    ['A3', 'B3', 'C3', 'D3'],
    ['A4', 'B4', 'C4', 'D4'],
  ];

  List<List<String>> economySeats = [
    ['A5', 'B5', 'C5', 'D5'],
    ['A6', 'B6', 'C6', 'D6'],
  ];

  List<List<bool>> businessSelection = [
    [false, false, true, true],  // C2 and D2 are selected
    [false, false, false, false],
    [false, false, false, false],
    [false, false, false, false],
  ];

  List<List<bool>> economySelection = [
    [false, false, false, false],
    [false, false, false, false],
  ];

  double seatPrice = 7858;  // Price for demonstration purposes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selecting Seat"),
      ),
      body: Column(
        children: [
          // Route and Seat Status Legend
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("SFO → MIL", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    _buildLegend(Color(0xFFD3D3D3), "Reserved"),
                    SizedBox(width: 8),
                    _buildLegend(Color(0xFFF3E5F5), "Available"),
                    SizedBox(width: 8),
                    _buildLegend(Colors.amber, "Selected"),
                  ],
                ),
              ],
            ),
          ),

          // Seat Selection Grid
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildSeatClass("Business Class", businessSeats, businessSelection),
                  _buildSeatClass("Economy Class", economySeats, economySelection),
                ],
              ),
            ),
          ),

          // Bottom Summary and Order Button
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Class", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Business"),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Passengers", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("2 Adults"),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Seats", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("C2, D2"),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Price", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("₹ $seatPrice"),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Place Order Action
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  ),
                  child: Text("Place Order", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegend(Color color, String text) {
    return Row(
      children: [
        Container(width: 15, height: 15, color: color),
        SizedBox(width: 4),
        Text(text),
      ],
    );
  }

  Widget _buildSeatClass(String className, List<List<String>> seats, List<List<bool>> selection) {
    return Column(
      children: [
        Text(className, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: seats[0].length,
            childAspectRatio: 1.5,
          ),
          itemCount: seats.length * seats[0].length,
          itemBuilder: (context, index) {
            int row = index ~/ seats[0].length;
            int col = index % seats[0].length;
            String seat = seats[row][col];
            bool isSelected = selection[row][col];

            return GestureDetector(
              onTap: () {
                setState(() {
                  selection[row][col] = !isSelected;
                });
              },
              child: Container(
                margin: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.amber : Color(0xFFF3E5F5),
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.black, width: 0.5),
                ),
                child: Center(
                  child: Text(
                    seat,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}


void main() => runApp(MaterialApp(home:SeatSelectionScreen()));
