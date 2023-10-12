import 'package:flutter/material.dart';

import 'package:travel_guide_app/custom/custom_buttomNavigationBar.dart';
import 'package:travel_guide_app/custom/custom_search.dart';
import 'package:travel_guide_app/places/historic_place/historic.dart';
import 'package:travel_guide_app/places/historic_place/historic_custom/custom_historical_sidescroll.dart';
import 'package:travel_guide_app/places/monastery/monastery.dart';
import 'package:travel_guide_app/places/monastery/monastery_custom/cutsom_monastery.dart';
import 'package:travel_guide_app/places/temples/temple.dart';
import 'package:travel_guide_app/places/temples/temple_custom/custom_sidescroll.dart';
import 'package:travel_guide_app/screen/search_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: Colors.blueGrey,
          title: const Center(child: Text('Home Page')),
        ),
        drawer: const Drawer(),
        body: SingleChildScrollView(
          child: SizedBox(
            height: 1500,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchScreen())),
                    child: const CustomSearch(
                      title: 'Search',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.temple_hindu,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Temple()),
                          );
                        },
                      ),
                      IconButton(
                        icon: const ImageIcon(
                            AssetImage('assets/icons/sightseeing.png')),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HistoricalPlace()),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.temple_buddhist,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MonasteryPlace()),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Experience peace and history in our ancient temple sanctuary.",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const Expanded(child: SideScrollScreen()),
                  const Text(
                    "Where history breathes, beauty whispers.",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const Expanded(child: HistoricalSlide()),
                  const Text(
                    "Serene sanctuary of spirituality and peace.",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const Expanded(child: MonasterySlide()),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: CustomButtomAppBar(
          onPressed: () {
            Scrollable.ensureVisible(CustomSearch.searchKey.currentContext!);
          },
        ),
      ),
    );
  }
}
