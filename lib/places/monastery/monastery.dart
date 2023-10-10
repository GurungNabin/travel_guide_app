import 'package:flutter/material.dart';

import 'package:travel_guide_app/places/monastery/monastery_model.dart';
import 'package:travel_guide_app/places/monastery/monastery_services.dart';

class MonasteryPlace extends StatefulWidget {
  const MonasteryPlace({super.key});

  @override
  State<MonasteryPlace> createState() => _MonasteryPlaceState();
}

class _MonasteryPlaceState extends State<MonasteryPlace> {
  final MonasteryServices monasteryServices = MonasteryServices();
  late UserMonasteryModel userMonasteryModel;
  List<UserMonasteryModel> monasteryData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Center(child: Text('Monastery Places')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
            future: monasteryServices.getMonasteryData(context: context),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else if (snapshot.hasData) {
                monasteryData = snapshot.data;

                return ListView.builder(
                  itemCount: monasteryData.length,
                  itemBuilder: (context, index) {
                    final history = monasteryData[index];
                    return InkWell(
                      onTap: () {},
                      child: Card(
                        margin: const EdgeInsets.only(bottom: 20),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                          child: Column(
                            children: [
                              Text(
                                history.title,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Image.network(history.image),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                history.description,
                                maxLines: 4,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text('No data available'),
                );
              }
            }),
      ),
    );
  }
}
