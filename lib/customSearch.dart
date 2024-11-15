import 'package:flutter/material.dart';
import 'package:wallpaper/Tabs_Page/fourK_Page.dart';
import 'package:wallpaper/Tabs_Page/messi_wallpaper.dart';
import 'package:wallpaper/Tabs_Page/nature_wallpaper.dart';
import 'package:wallpaper/Tabs_Page/neymar_wallpaper.dart';
import 'package:wallpaper/Tabs_Page/ronaldo_wallpaper.dart';
import 'package:wallpaper/Tabs_Page/space_wallpaper.dart';


class CustomSearchDelegate extends SearchDelegate{
  List<String> SearchTerms = [
    "Islamic",
    "Space",
    "Nature",
    "Cristiano Ronaldo",
    "Lionel Messi",
    "Neymar Jr",
    "Computer",


  ];
  Widget? selectedPage;
  List SearchPages = [
      FourKPage(),
      Space(),
      nature(),
      ronaldoPage(),
      messiPage(),
      neymarPage(),

  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        query = '';
      }, icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context){
    return IconButton(
        onPressed: (){
          close(context, null);
        }, icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context){
    List<Widget> matchPages = [];
    List<String> matchQuery = [];
    for (var i = 0; i < SearchTerms.length; i++) {
      var term = SearchTerms[i];
      if (term.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(term);
        matchPages.add(SearchPages[i]);
      }
    }
    if (matchQuery.isEmpty) {
      return const Center(
        child: Text('موردی یافت نشد'),
      );
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context ,index){
          var result = matchQuery[index];
          var page = matchPages[index];
          return ListTile(
            onTap: (){
              close(context, page);
            },
            title: Text(result),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context){
    List<String> matchQuery = [];
    List<Widget> matchPages = [];

    for (var i = 0; i < SearchTerms.length; i++) {
      var term = SearchTerms[i];
      if (term.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(term);
        matchPages.add(SearchPages[i]);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        var page = matchPages[index];

        return ListTile(
          title: Text(
            result,
            textAlign: TextAlign.right,
            style: const TextStyle(color: Colors.white),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          },
        );
      },
    );
  }

}