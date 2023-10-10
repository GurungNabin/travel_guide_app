import 'package:flutter/material.dart';

class CustomSearch extends StatefulWidget {
  const CustomSearch({Key? key, required this.title, required this.onSearch})
      : super(key: key);
  final String title;
  final Function(String) onSearch;

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
        onChanged: (query) {
          widget.onSearch(query);
        },
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
