import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class GenderScreen extends StatefulWidget {
  late String? personName;

  GenderScreen({super.key, required this.personName});

  @override
  _GenderScreenState createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String? gender;
  Color? displayColor;
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    fetchGender();
  }

  Future<void> fetchGender() async {
    try {
      final response = await http.get(
          Uri.parse('https://api.genderize.io/?name=${widget.personName}'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        gender = data['gender'];

        setState(() {
          if (gender == 'male') {
            displayColor = const Color.fromARGB(255, 112, 148, 179);
          } else {
            displayColor = displayColor = gender == 'female'
                  ? const Color.fromARGB(255, 197, 132, 177)
                  : const Color.fromARGB(255, 229, 225, 128);
          }
        });
      } else {
        // Handle API error
        print('API request failed with status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network or parsing error
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gender Prediction',
        style: TextStyle(color:Color.fromARGB(244, 217, 101, 136)),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Enter a name',
                 
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.personName = _nameController.text;
                  fetchGender();
                });
              },
              child: const Text('Predict Gender'),
            ),
            const SizedBox(height: 20),
            Text('Person: ${widget.personName}'),
            const SizedBox(height: 20),
            Text('Gender: $gender'),
            const SizedBox(height: 20),
            Container(
              width: 100,
              height: 100,
              color: displayColor ?? Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
