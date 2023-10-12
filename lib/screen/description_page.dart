import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class DescriptionPage extends StatefulWidget {
  final String name;
  final String image;
  final String description;
  final String address;
  final double latitude;
  final double longitude;
  const DescriptionPage(
      {super.key,
      required this.name,
      required this.image,
      required this.description,
      required this.address,
      required this.latitude,
      required this.longitude});

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  late double lat;
  late double lon;
  bool isLoading = false;

  @override
  void initState() {
   
    super.initState();
    getCurrentLocation();
  }

  void assignValue() async {
    await getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    late double latitude;
    late double longitude;
    try {
      setState(() {
        isLoading = true;
      });
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      latitude = position.latitude;
      longitude = position.longitude;
      lon = longitude;
      lat = latitude;

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.blueGrey,
        title: Text(widget.name,),
        
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Image.network(
                      widget.image,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.black,
                        ),
                        const SizedBox(
                            width:
                                8), // Add some space between the icon and text
                        Expanded(
                          child: Text(
                            widget.address,
                            style: const TextStyle(
                                color: Colors.blueGrey, fontSize: 16),
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.description,
                      style: const TextStyle(fontSize: 18),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 300,
                      child: FlutterMap(
                        options: MapOptions(
                          enableScrollWheel: true,
                          keepAlive: true,
                          zoom: 18,
                          maxZoom: 18,
                          minZoom: 3,
                          slideOnBoundaries: true,
                          center: LatLng(widget.latitude, widget.longitude),
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                            subdomains: const ["a", "b", "c"],
                          ),
                          MarkerLayer(
                            markers: [
                              Marker(
                                point:
                                    LatLng(widget.latitude, widget.longitude),
                                builder: (context) {
                                  return const Icon(
                                    Icons.pin_drop,
                                    color: Colors.red,
                                    size: 40,
                                  );
                                },
                              ),
                              Marker(
                                point: LatLng(lat, lon),
                                builder: (context) {
                                  return const Icon(
                                    Icons.circle,
                                    color: Colors.blue,
                                    size: 30,
                                  );
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
