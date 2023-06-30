import 'package:flutter/material.dart';
import 'package:good_search_appbar/good_search_appbar.dart';

class SearchEventPage extends StatelessWidget {
  const SearchEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          GoodSearchAppBar(title: 'cari event', onSearchChanged: (keyword) {}),
      body: const Center(
        child: Text('Search Event Page'),
      ),
    );
  }
}
