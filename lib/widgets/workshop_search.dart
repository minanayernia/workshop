import 'package:flutter/material.dart';
import 'package:workshop/models/workshop.dart';
import 'package:workshop/widgets/search_input.dart' as MySearchInput;

class WorkshopSearch extends MySearchInput.SearchDelegate<Workshop> {
  final List<Workshop> workshops;

  WorkshopSearch({@required this.workshops});

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.close),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Workshop> suggestItem = query.isEmpty
        ? []
        : workshops.where((wk) {
            return (wk.name)
                .contains(query);
          }).toList();
    return ListView.builder(
        itemCount: suggestItem.length,
        itemBuilder: (_, i) => ListTile(
              title: Text(
                suggestItem[i].name,
                textDirection: TextDirection.rtl,
              ),
              trailing: Icon(Icons.library_books),
              onTap: () {
                close(context, suggestItem[i]);
              },
            ));
  }
}
