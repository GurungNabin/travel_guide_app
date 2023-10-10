import 'package:flutter/material.dart';
import 'package:travel_guide_app/places/historic_place/historic_model.dart';
import 'package:travel_guide_app/places/historic_place/historic_services.dart';

class HistoricalPlace extends StatefulWidget {
  const HistoricalPlace({super.key});

  @override
  State<HistoricalPlace> createState() => _HistoricalPlaceState();
}

class _HistoricalPlaceState extends State<HistoricalPlace> {
  final HistoricPlaceServices historicPlaceServices = HistoricPlaceServices();
  late UserHistoricModel userHistoricModel;
  List<UserHistoricModel> historicalData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Center(child: Text('Historic Places')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
            future: historicPlaceServices.getHistoricData(context: context),
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
                historicalData = snapshot.data;

                return ListView.builder(
                  itemCount: historicalData.length,
                  itemBuilder: (context, index) {
                    final history = historicalData[index];
                    return InkWell(
                      onTap: () {},
                      child: Card(
                        margin: const EdgeInsets.only(bottom: 20),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                          child: Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  history.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                              ),
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
