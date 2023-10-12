import 'package:flutter/material.dart';
import 'package:travel_guide_app/screen/search_screen.dart';

class CustomSearch extends StatefulWidget {
  const CustomSearch({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  // Getter method to access the searchKey
  static GlobalKey get searchKey => _CustomSearchState.searchKey;

  @override
  State<CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  static final GlobalKey searchKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      key: searchKey,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        focusNode: searchFocusNode,
        controller: _searchController,
        enabled: false,
        decoration: InputDecoration(
          hintText: 'Search...',
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () => _searchController.clear(),
          ),
          prefixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              searchFocusNode.requestFocus();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SearchScreen()));
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }
}

// class CustomSearchDelegate extends SearchDelegate {
//   List<UserTempelsModel> searchTerms;
//   CustomSearchDelegate(this.searchTerms);
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         onPressed: () {
//           query = '';
//         },
//         icon: const Icon(Icons.clear),
//       )
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         close(context, null);
//       },
//       icon: const Icon(Icons.arrow_back),
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     List<UserTempelsModel> matchQuery = [];
//     for (var temple in searchTerms) {
//       if (temple.name.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(temple);
//       }
//     }
//     return ListView.builder(
//       itemBuilder: (context, index) {
//         var result = matchQuery[index];
//         return ListTile(
//           title: Text(result.name),
//         );
//       },
//       itemCount: matchQuery.length,
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<UserTempelsModel> matchQuery = [];
//     for (var temple in searchTerms) {
//       if (temple.name.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(temple);
//       }
//     }
//     return ListView.builder(
//       itemCount: matchQuery.length,
//       itemBuilder: (context, index) {
//         var result = matchQuery[index];
//         return ListTile(
//           title: Text(result.name),
//         );
//       },
//     );
//   }
// }
