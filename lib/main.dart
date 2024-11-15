import 'package:firebase_core/firebase_core.dart';
import 'package:flight_bookingapp/screens/flightlist.dart';
import 'package:flight_bookingapp/screens/profile.dart';
import 'package:flight_bookingapp/screens/homescreen.dart';
import 'package:flight_bookingapp/screens/notificationscreen.dart';
import 'package:flight_bookingapp/util_files/Login.dart';
import 'package:flight_bookingapp/util_files/providerdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 runApp(ChangeNotifierProvider(
   create: (BuildContext context)=>providerdata(),
   child: MaterialApp(
     debugShowCheckedModeBanner: false,
    home: LoginScreen(),
   ),
 ));
}
 class BottomNavigation extends StatefulWidget {
   const BottomNavigation({super.key});

   @override
   State<BottomNavigation> createState() => _BottomNavigationState();
 }

 class _BottomNavigationState extends State<BottomNavigation> {

 List<Widget>_pages=<Widget>[
    Homescreen(),
   FlightList(),
   seatsection(),
  finalscreen(),
 ];

int selectedindex=0;

void ontaped(index){
 setState(() {
   selectedindex=index;
 });
}



   @override
   Widget build(BuildContext context) {
     return Scaffold(
      body: _pages[selectedindex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: selectedindex,
              onTap: ontaped,
              backgroundColor: Color.fromRGBO(194, 178, 128, 1.0).withOpacity(0.2),
              items:[
           BottomNavigationBarItem(icon:Icon(Icons.home,color: Colors.pink.withOpacity(0.9),),label:'home'),
           BottomNavigationBarItem(icon:Icon(Icons.search,color: Colors.pink.withOpacity(0.9)),label:'seach'),
           BottomNavigationBarItem(icon:Icon(Icons.email,color: Colors.pink.withOpacity(0.9)),label:'notification'),
           BottomNavigationBarItem(icon:Icon(Icons.account_circle,color: Colors.pink.withOpacity(0.9)),label:'profile'),
          ],
          selectedFontSize:20,
            selectedItemColor: Colors.black,
            showSelectedLabels: true,
          ),
        ),
      ),


     );
   }
 }
