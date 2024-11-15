import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../util_files/providerdata.dart';
import '../util_files/seatselectionscreen.dart';

class FlightList extends StatefulWidget {
  @override
  _FlightListState createState() => _FlightListState();
}

class _FlightListState extends State<FlightList> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _allItems = [
    {
      "date": "25 Oct, 9:40 AM",
      "from": "Paris",
      "to": "SFO",
      "name":"LY2345",
      "rate":"\$200",
    },
    {
      "date": "26 Oct, 10:00 AM",
      "from": "Switzerland",
      "to": "NYC",
      "name":"SH2345",
      "rate":"\$300",
    },
    {
      "date": "27 Oct, 11:30 AM",
      "from": "America",
      "to": "LAX",
      "name":"SF345",
      "rate":"\$200",
    },
    {
      "date": "28 Oct, 1:00 PM",
      "from": "Japan",
      "to": "SEA",
      "name":"DA2345",
      "rate":"\$200",
    },
    {
      "date": "29 Oct, 2:45 PM",
      "from": "India",
      "to": "DFW",
      "name":"LY245",
      "rate":"\$200",
    },
  ]; // Initial list of flight items
  List<Map<String, String>> _filteredItems = []; // Filtered list of flight items

  @override
  void initState() {
    super.initState();
    _filteredItems = List.from(_allItems); // Initially show all items
    _searchController.addListener(_filterItems);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterItems);
    _searchController.dispose();
    super.dispose();
  }

  void _filterItems() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredItems = _allItems
          .where((item) =>
      item["from"]!.toLowerCase().contains(query) ||
          item["to"]!.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04), // Padding relative to screen width
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(194, 178, 128, 1.0).withOpacity(0.2),
                labelText: "Search",
                hintText: "Search by place...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02), // Adjust spacing based on screen height

            Text("Available Flights...", style: TextStyle(fontSize: screenWidth * 0.05)),
            Expanded(
              child: _filteredItems.isNotEmpty
                  ? ListView.builder(
                itemCount: _filteredItems.length,
                itemBuilder: (context, index) {
                  final item = _filteredItems[index];
                  return GestureDetector(
                    onTap: () {
                      final provider = Provider.of<providerdata>(context, listen: false);
                      provider.setFlightRoute(item["from"]!, item["to"]!);
                      provider.setFlightDateAndTime(item["date"]!, '11:40');
                      provider.setFlightname(item["name"]!);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SeatSelection()));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                      child: Container(
                        height: screenHeight * 0.2, // Dynamic height based on screen height
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.9),
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.4),
                              spreadRadius: 4,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item["date"]!,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: screenWidth * 0.04,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        item["from"]!,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: screenWidth * 0.05,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '11:40',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: screenWidth * 0.04,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        item["to"]!,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: screenWidth * 0.05,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
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
                                  Icon(Icons.flight, color: Colors.pink),
                                  Expanded(
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1,
                                      indent: 10,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    item["name"]!,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: screenWidth * 0.05,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  Text(
                                    item["rate"]!,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: screenWidth * 0.05,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
                  : Center(
                child: Text(
                  "No results found",
                  style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
