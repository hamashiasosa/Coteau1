import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class UniversityScreen extends StatefulWidget {
  const UniversityScreen({super.key});

  @override
  _UniversityScreenState createState() => _UniversityScreenState();
}

class _UniversityScreenState extends State<UniversityScreen> {
  List<dynamic> universities = [];
  String selectedCountry = "Dominican Republic";

  Future<void> fetchUniversities() async {
    final response = await http.get(Uri.parse(
        'http://universities.hipolabs.com/search?country=$selectedCountry'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        universities = data;
      });
    } else {
      throw Exception('Failed to fetch universities');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUniversities();
  }

  void updateUniversities(String country) {
    setState(() {
      selectedCountry = country;
      universities = [];
    });
    fetchUniversities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Universidades',
        style: TextStyle(color: Color.fromARGB(244, 217, 101, 136)),
        ),
      ),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'País'),
            onChanged: (value) {
              updateUniversities(value);
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: universities.length,
              itemBuilder: (context, index) {
                final university = universities[index];
                return ListTile(
                  title: Text(university['name']),
                  subtitle: Text(
                      'Domain: ${university['domains'][0]}\nWeb: ${university['web_pages'][0]}'),
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
