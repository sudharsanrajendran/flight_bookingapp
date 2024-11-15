import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
class providerdata extends ChangeNotifier
{
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

  double businessSeatPrice = 1000.0;
   double economySeatPrice = 550.0;

  List<String> selectedSeats = [];
  double totalAmount = 0.0;
  int totalSelectedSeats = 0;


  void toggleSeatSelection(bool isBusiness, int row, int col) {
      String seat = isBusiness ? businessSeats[row][col] : economySeats[row][col];
      if (isBusiness) {
        businessSelection[row][col] = !businessSelection[row][col];
      } else {
        economySelection[row][col] = !economySelection[row][col];
      }

      // If the seat is selected, add to the selected seats and update amount
      if (isBusiness && businessSelection[row][col]) {
        selectedSeats.add(seat);
        totalAmount += businessSeatPrice;
        totalSelectedSeats++;
      } else if (isBusiness && !businessSelection[row][col]) {
        selectedSeats.remove(seat);
        totalAmount -= businessSeatPrice;
        totalSelectedSeats--;
      } else if (!isBusiness && economySelection[row][col]) {
        selectedSeats.add(seat);
        totalAmount += economySeatPrice;
        totalSelectedSeats++;
      } else if (!isBusiness && !economySelection[row][col]) {
        selectedSeats.remove(seat);
        totalAmount -= economySeatPrice;
        totalSelectedSeats--;
      }
      notifyListeners();

  }

  String _fromLocation = '';
  String _toLocation = '';
  String _selectedDate = '';
  String _selectedTime = '';
  String _Flightname='';
  String _userInput = '';
  String get fromLocation => _fromLocation;
  String get toLocation => _toLocation;
  String get selectedDate => _selectedDate;
  String get selectedTime => _selectedTime;
  String get flightname => _Flightname;
  String get userInput => _userInput;

  void resetSelections() {
    selectedSeats.clear();
    totalAmount = 0;
    totalSelectedSeats = 0;
    notifyListeners();
  }

  void updateUserInput(String input) {
    _userInput = input;
    notifyListeners();
  }

  void setFlightname(String name,){
    _Flightname=name;
    notifyListeners();
  }
  void setFlightRoute(String from, String to) {
    _fromLocation = from;
    _toLocation = to;
    notifyListeners();
  }

  void setFlightDateAndTime(String date, String time) {
    _selectedDate = date;
    _selectedTime = time;
    notifyListeners();
  }

  void clearSelections() {
    for (int row = 0; row < businessSelection.length; row++) {
      for (int col = 0; col < businessSelection[row].length; col++) {
        businessSelection[row][col] = false;
      }
    }
    for (int row = 0; row < economySelection.length; row++) {
      for (int col = 0; col < economySelection[row].length; col++) {
        economySelection[row][col] = false;
      }
    }
    notifyListeners();
  }



  Future<void> Signup(String email, String password)async
  {
    const url='https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCPBTSccij6nsEL8fL_8SSDsBTFW2JT57A';
    try{
      final response = await http.post(Uri.parse(url),
          body: json.encode(
              {
                'email':email,
                "password":password,
                'returnSecureToken':true,
              }

          )
      );
      final responsedata= json.decode(response.body);
      print(responsedata);


    }
    catch (error){
      throw error;
    }
  }


  Future<void> login(String email, String password) async {
    try {
      const url ='https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCPBTSccij6nsEL8fL_8SSDsBTFW2JT57A';

      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }),
      );

      final responseData = json.decode(response.body);
      print(responseData);

      if (response.statusCode == 200) {
        // Successfully logged in
        String idToken = responseData['idToken'];
        print('Login successful! Token: $idToken');
        // Here you could store the token for authenticated requests
      } else {
        // Handle errors returned by Firebase
        String errorMessage = responseData['error']['message'] ?? 'An error occurred';
        throw Exception('Login failed: $errorMessage');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('An error occurred during login.'); // You can handle this in your UI
    }



    }










}



