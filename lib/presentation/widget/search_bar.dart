import 'package:flutter/material.dart';
import 'image_loader.dart';

class SearchBar extends SearchDelegate<String> {
  final List<SearchModel> searchModels;
  final void Function(SearchModel) onItemClicked;

  SearchBar({required this.searchModels, required this.onItemClicked});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, '');
        },
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final list = searchModels.where((model) {
      var title = model.title;
      if (title == null) title = "";
      return title.toLowerCase().startsWith(query) || title.toUpperCase().startsWith(query);
    }).toList();
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          var item = list[index];
          return ListTile(
              onTap: () => onItemClicked(item),
              leading: ImageLoader(isCircle: true,iconHash: item.iconHash, text: item.title),
              title: RichText(
                text: TextSpan(
                  text: "${item.title?.substring(0, query.length)}",
                  style: TextStyle(
                    color: Colors.black , fontWeight: FontWeight.bold
                  ),
                  children: [
                    TextSpan(
                      text: item.title?.substring(query.length),
                      style: TextStyle(color: Colors.grey)
                    )
                  ]
                ),
              ));
        });
  }
}

class SearchModel {
  final String? id;
  final String? title;
  final String? iconHash;

  SearchModel({required this.title, required this.iconHash, this.id});
}
