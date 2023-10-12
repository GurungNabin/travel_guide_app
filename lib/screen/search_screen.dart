import 'package:flutter/material.dart';
import 'package:travel_guide_app/places/all_places/all_places_model.dart';
import 'package:travel_guide_app/places/all_places/all_places_services.dart';
import 'package:travel_guide_app/screen/description_page.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<AllPlacesModel> placesModel = [];
  List<AllPlacesModel> beforeSearch = [];
  final TextEditingController searchController = TextEditingController();
  bool isLoading = false;
  final AllPlacesServices placesServices = AllPlacesServices();

  void filterSearch(String query) {
    placesModel = beforeSearch
        .where(
            (place) => place.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchSearchedProduct();
  }

  void fetchSearchedProduct() async {
    setState(() {
      isLoading = true;
    });
    beforeSearch = await placesServices.getPlacesData(context: context);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 42,
                    margin: const EdgeInsets.only(left: 15),
                    child: Material(
                      borderRadius: BorderRadius.circular(7),
                      elevation: 1,
                      child: TextFormField(
                        maxLines: 2,
                        controller: searchController,
                        onChanged: (value) {
                          if (value.length > 1) {
                            filterSearch(value);
                          } else {
                            setState(() {
                              if (searchController.text.isEmpty) {
                                placesModel = [];
                              }
                            });
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: InkWell(
                            onTap: () {},
                            child: const Padding(
                                padding: EdgeInsets.only(left: 6),
                                child: Icon(Icons.search,
                                    color: Colors.black, size: 23)),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(top: 10),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                            borderSide:
                                BorderSide(color: Colors.black38, width: 1),
                          ),
                          hintText: 'Search here',
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  height: 42,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: const Icon(Icons.mic, color: Colors.black, size: 25),
                ),
              ],
            ),
          )),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : beforeSearch.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: placesModel.length,
                        
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DescriptionPage(
                                            name: placesModel[index].name,
                                            image: placesModel[index].image,
                                            description:
                                                placesModel[index].description,
                                            address: placesModel[index].address,
                                            latitude: double.parse(
                                                placesModel[index].latitude),
                                            longitude: double.parse(
                                                placesModel[index].longitude),
                                          )));
                            },
                            child: Card(
                                child: Row(
                              children: [
                                ClipRRect(
                                  child: Image.network(
                                    placesModel[index].image,
                                    height: 80,
                                    width: 80,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: 250,
                                  child: Text(
                                    placesModel[index].name,
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'monospace',
                                    ),
                                  ),
                                )
                              ],
                            )),
                          );
                        },
                      ),
                    ),
                  ],
                ),
    );
  }
}
