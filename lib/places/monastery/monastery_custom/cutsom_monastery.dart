import 'package:flutter/material.dart';

import 'package:travel_guide_app/places/monastery/monastery_model.dart';
import 'package:travel_guide_app/places/monastery/monastery_services.dart';
import 'package:travel_guide_app/screen/description_page.dart';

class MonasterySlide extends StatefulWidget {
  const MonasterySlide({super.key});

  @override
  State<MonasterySlide> createState() => _MonasterySlideState();
}

class _MonasterySlideState extends State<MonasterySlide> {
  final MonasteryServices monasteryServices = MonasteryServices();
  late UserMonasteryModel userMonasteryModel;
  List<UserMonasteryModel> monasteryData = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 350,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: monasteryData.length,
                      itemBuilder: (context, index) {
                        final datas = monasteryData[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DescriptionPage(
                                  name: datas.name,
                                  image: datas.image,
                                  description: datas.description,
                                  address: datas.address,
                                  latitude: double.parse(datas.latitude),
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
                                  ),
                                ),
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
