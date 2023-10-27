import 'package:flutter/material.dart'; 
import 'package:http/http.dart' as http; 
import 'dart:convert'; 
import 'package:intl/intl.dart'; 

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String apiKey = '20fdfb76008f0d97399a7057b61972e9';
  String city = 'Distrito Nacional';
  Map<String, dynamic>? weatherData;

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
  }

  Future<void> _fetchWeatherData() async {
    final apiUrl = 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        weatherData = data;
      });
    }
  }

  String getWeatherIcon(String condition) {
     
    if (condition.contains('rainy')) {
      return 'lluvia.gif';
    } else if (condition.contains('cloudy')) {
      return 'nublado.gif';
    } else if (condition.contains('sunny')) {
      return 'soleado.gif';
    } else {
      return 'weather.gif';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: weatherData != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Conoce el clima del dia de hoy!',
                    style: TextStyle(fontSize: 24, color: Color.fromARGB(244, 217, 101, 136)),
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    'Santo Domingo',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    '${(weatherData!['weather'][0]['description'])}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Image.asset(
                    'assets/images/${getWeatherIcon(weatherData!['weather'][0]['description'].toString())}', // Asegúrate de tener las imágenes en la carpeta "assets"
                    height: 50,
                    width: 50,
                  ),
                  Text(
                    'Temperatura: ${(weatherData!['main']['temp'] - 273.15).toInt()}°C',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Humedad: ${weatherData!['main']['humidity']}%',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Fecha: ${DateFormat.yMd().format(DateTime.now())}',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}