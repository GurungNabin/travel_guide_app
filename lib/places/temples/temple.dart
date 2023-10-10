import 'package:flutter/material.dart';
import 'package:travel_guide_app/places/temples/temple_model.dart';
import 'package:travel_guide_app/places/temples/temple_services.dart';
import 'package:travel_guide_app/screen/description_page.dart';

class Temple extends StatefulWidget {
  const Temple({super.key});

  @override
  State<Temple> createState() => _TempleState();
}

class _TempleState extends State<Temple> {
  final TempleService templeService = TempleService();
  late UserTempelsModel userTempelsModel;
  List<UserTempelsModel> templeData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Center(child: Text('Temples')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
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

                return ListView.builder(
                  itemCount: templeData.length,
                  itemBuilder: (context, index) {
                    final datas = templeData[index];
                    return InkWell(
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
                                  )),
                        );
                      },
                      child: Card(
                        margin: const EdgeInsets.only(bottom: 20),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 300,
                                    child: Text(
                                      datas.name,
                                      softWrap: true,
                                      maxLines: 2,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                datas.address,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Image.network(datas.image,
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.cover),
                              Text(
                                datas.description,
                                maxLines: 4,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
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
