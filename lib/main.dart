import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class City {
  String name;
  double population; // in millions
  int id;
  String state;

  City({
    required this.name,
    required this.population,
    required this.id,
    required this.state,
  });
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<City> cityList = [
    City(name: "Mumbai", population: 20.4, id: 101, state: "Maharashtra"),
    City(name: "Bengaluru", population: 12.3, id: 102, state: "Karnataka"),
    City(name: "Chennai", population: 11.5, id: 103, state: "Tamil Nadu"),
    City(name: "Kolkata", population: 14.8, id: 104, state: "West Bengal"),
    City(name: "Hyderabad", population: 10.2, id: 105, state: "Telangana"),
    City(name: "Madurai", population: 3.0, id: 106, state: "Tamil Nadu"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cities In India",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Cities In India"),
          backgroundColor: const Color.fromARGB(255, 239, 141, 14),
        ),
        body: ListView.builder(
          itemCount: cityList.length,
          itemBuilder: (context, index) {
            final city = cityList[index];
            return Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    child: Text(city.name[0]),
                  ),
                  title: Text(city.name),
                  subtitle: Text(
                      "Population: ${city.population} million, State: ${city.state}"),
                  trailing: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Visit City"),
                          content: Text("Would you like to visit ${city.name}?"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Ok"),
                            )
                          ],
                        ),
                      );
                    },
                    child: const Text("Visit"),
                  ),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("${city.name} is selected."),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
