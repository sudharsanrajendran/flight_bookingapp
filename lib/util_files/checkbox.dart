import 'package:flutter/material.dart';

class CheckboxExample extends StatefulWidget {
  @override
  _CheckboxExampleState createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  List<bool> _isChecked = [false, false, false]; // Checkbox states
  int _totalAmount = 0; // Total amount

  void _updateAmount() {
    // Calculate the total amount based on selected checkboxes
    int amount = 0;
    for (bool checked in _isChecked) {
      if (checked) {
        amount += 100; // Each checked box adds 100 to the total
      }
    }
    setState(() {
      _totalAmount = amount; // Update the total amount
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Checkbox Example")),
      body: Column(
        children: [
          // Generate checkboxes with specific colors and amounts
          ...List.generate(_isChecked.length, (index) {
            return CheckboxListTile(
              title: Text("Checkbox ${index + 1} - Amount: 100"),
              value: _isChecked[index],
              onChanged: (bool? value) {
                setState(() {
                  _isChecked[index] = value ?? false;
                });
                _updateAmount(); // Update amount when checkbox changes
              },
              // Set color based on checkbox state
              activeColor: _isChecked[index] ? Colors.red : Colors.green,
            );
          }),
          SizedBox(height: 20),
          // Display total amount
          Text(
            "Total Amount: $_totalAmount",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
