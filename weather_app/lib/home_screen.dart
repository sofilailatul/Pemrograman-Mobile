import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _weatherInfo = "Fetching weather...";
  bool isLoaded = false;
  num temp = 0;
  num press = 0;
  num hum = 0;
  num cover = 0;
  String cityname = '';
  final TextEditingController _cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    try {
      var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
        forceAndroidLocationManager: true,
      );
      getCurrentCityWeather(position);
    } catch (e) {
      setState(() {
        _weatherInfo = 'Data unavailable: $e';
      });
    }
  }

  Future<void> getCurrentCityWeather(Position position) async {
    var client = http.Client();
    var uri = '${domain}lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey';
    var url = Uri.parse(uri);
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      updateUI(data);
      setState(() {
        isLoaded = true;
      });
    } else {
      setState(() {
        _weatherInfo = 'Failed to fetch weather data';
      });
    }
  }

  Future<void> getCityWeather(String cityName) async {
    var client = http.Client();
    var uri = '${domain}q=$cityName&appid=$apiKey';
    var url = Uri.parse(uri);
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      updateUI(data);
      setState(() {
        isLoaded = true;
      });
    } else {
      setState(() {
        _weatherInfo = 'Failed to fetch weather data';
      });
    }
  }

  void updateUI(var decodedData) {
    setState(() {
      if (decodedData == null) {
        temp = 0;
        press = 0;
        hum = 0;
        cover = 0;
        cityname = 'Not available';
      } else {
        temp = decodedData['main']['temp'] - 273;
        press = decodedData['main']['pressure'];
        hum = decodedData['main']['humidity'];
        cover = decodedData['clouds']['all'];
        cityname = decodedData['name'];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffFA8BFF),
                Color(0xff2BD2FF),
                Color(0xff2BFF88),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child: Visibility(
            visible: isLoaded,
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height * 0.09,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Center(
                    child: TextFormField(
                      onFieldSubmitted: (String s) {
                        setState(() {
                          cityname = s;
                          getCityWeather(s);
                          isLoaded = false;
                          _cityController.clear();
                        });
                      },
                      controller: _cityController,
                      cursorColor: Colors.white,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search city',
                        hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.white.withOpacity(0.7),
                          fontWeight: FontWeight.w600,
                        ),
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          size: 25,
                          color: Colors.white.withOpacity(0.7),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.pin_drop,
                        color: Colors.red,
                        size: 40,
                      ),
                      Text(
                        cityname,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                buildWeatherCard('Temperature', Icons.thermostat, '${temp?.toInt()} ºC'),
                buildWeatherCard('Pressure', Icons.speed, '$press hPa'),
                buildWeatherCard('Humidity', Icons.water_drop, '$hum %'),
                buildWeatherCard('Cloud Cover', Icons.cloud, '$cover %'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildWeatherCard(String title, IconData icon, String value) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.12,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade900,
            offset: const Offset(1, 2),
            blurRadius: 3,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              icon,
              size: MediaQuery.of(context).size.width * 0.09,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            '$title: $value',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }
}