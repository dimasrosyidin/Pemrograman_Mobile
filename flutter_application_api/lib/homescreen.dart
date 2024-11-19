import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'constants.dart'; // Import file constants.dart
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoaded = false;
  num temp = 0;
  num press = 0;
  num hum = 0;
  num cover = 0;
  String cityname = '';
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    getCurrentCityWeather();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void updateUI(var decodedData) {
    setState(() {
      if (decodedData == null) {
        temp = 0;
        press = 0;
        hum = 0;
        cover = 0;
        cityname = 'Not available';
        isLoaded = false;
      } else {
        temp = decodedData['main']['temp'] - 273; // Konversi Kelvin ke Celcius
        press = decodedData['main']['pressure'];
        hum = decodedData['main']['humidity'];
        cover = decodedData['clouds']['all'];
        cityname = decodedData['name'];
        isLoaded = true;
      }
    });
  }

  Future<void> getCurrentCityWeather() async {
    final url = Uri.parse(weatherUrl);
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        updateUI(data);
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> getCityWeather(String cityname) async {
    final url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apiKey");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        updateUI(data);
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF1E3C72),
                Color(0xFF2A5298),
                Color(0xFF00B4DB),
              ],
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Pencarian kota
                    Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: TextFormField(
                          onFieldSubmitted: (String s) {
                            setState(() {
                              cityname = s;
                              getCityWeather(s);
                              isLoaded = false;
                              controller.clear();
                            });
                          },
                          controller: controller,
                          cursorColor: Colors.white,
                          style: TextStyle(
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
                    SizedBox(height: 30),
                    // Nama kota dengan ikon lokasi
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.pin_drop,
                            color: Colors.red,
                            size: MediaQuery.of(context).size.width * 0.08,
                          ),
                          SizedBox(width: 10),
                          Flexible(
                            child: Text(
                              cityname,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.06,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Visibility(
                      visible: isLoaded,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Jumlah kotak dalam satu baris
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1.2, // Rasio tinggi dan lebar kotak
                        ),
                        itemCount: 4, // Total parameter cuaca
                        itemBuilder: (context, index) {
                          // Data untuk setiap parameter
                          final weatherData = [
                            {
                              'title': 'Temperature',
                              'value': '${temp.toInt()} ºC',
                              'image': 'images/thermometer.png'
                            },
                            {
                              'title': 'Pressure',
                              'value': '${press} hPa',
                              'image': 'images/barometer.png'
                            },
                            {
                              'title': 'Humidity',
                              'value': '${hum}%',
                              'image': 'images/humidity.png'
                            },
                            {
                              'title': 'Cloud Cover',
                              'value': '${cover}%',
                              'image': 'images/cloudcover.png'
                            },
                          ];

                          final item = weatherData[index];

                          return buildWeatherCard(
                            context,
                            item['title']!,
                            item['value']!,
                            item['image']!,
                          );
                        },
                      ),
                      replacement: Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membuat kartu parameter cuaca
  Widget buildWeatherCard(
      BuildContext context, String title, String value, String imagePath) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            offset: Offset(2, 2),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Gambar parameter
          Image(
            image: AssetImage(imagePath),
            width: MediaQuery.of(context).size.width * 0.15,
          ),
          SizedBox(height: 8),
          // Teks parameter
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
