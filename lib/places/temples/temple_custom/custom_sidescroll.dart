import 'package:flutter/material.dart';
import 'package:travel_guide_app/places/temples/temple_model.dart';
import 'package:travel_guide_app/places/temples/temple_services.dart';
import 'package:travel_guide_app/screen/description_page.dart';

class SideScrollScreen extends StatefulWidget {
  const SideScrollScreen({super.key});

  @override
  State<SideScrollScreen> createState() => _SideScrollScreenState();
}

class _SideScrollScreenState extends State<SideScrollScreen> {
  final TempleService templeService = TempleService();
  late UserTempelsModel userTempelsModel;
  List<UserTempelsModel> templeData = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: templeService.getTempleData(context: context),
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
            templeData = snapshot.data;
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 330,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: templeData.length,
                        itemBuilder: (context, index) {
                          final datas = templeData[index];

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
                                    child: Text(datas.description),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text("No data Available"),
            );
          }
        });
  }
}
