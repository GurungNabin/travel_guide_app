import 'package:flutter/material.dart';
import 'package:travel_guide_app/places/historic_place/historic_model.dart';
import 'package:travel_guide_app/places/historic_place/historic_services.dart';
import 'package:travel_guide_app/screen/description_page.dart';

class HistoricalSlide extends StatefulWidget {
  const HistoricalSlide({super.key});

  @override
  State<HistoricalSlide> createState() => _HistoricalSlideState();
}

class _HistoricalSlideState extends State<HistoricalSlide> {
  final HistoricPlaceServices historicPlaceServices = HistoricPlaceServices();
  late UserHistoricModel userHistoricModel;
  List<UserHistoricModel> historicData = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
            historicData = snapshot.data;
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 350,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: historicData.length,
                      itemBuilder: (context, index) {
                        final datas = historicData[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DescriptionPage(
                                  title: datas.name,
                                  image: datas.image,
                                  description: datas.description,
                                  address: datas.address,
                                  latitude: double.parse(datas.laditude),
                                  longitude: double.parse(datas.longitude),
                                ),
                              ),
                            );
                          },
                          child: Card(
                            child: Column(
                              children: [
                                Image.network(
                                  datas.image,
                                  height: 200,
                                ),
                                Text(datas.name),
                                SizedBox(
                                    width: 300,
                                    child: Text(
                                      datas.description,
                                      maxLines: 5,
                                    )),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            );
          } else {
            return const Center(
              child: Text("No data Available"),
            );
          }
        });
  }
}
