import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

var query = ValueNotifier('');

class SearchPage extends StatefulWidget {
  final List<TabItem> contentList;
  final String title;

  SearchPage(this.contentList, this.title);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(widget.title),
      ),
      body: Column(children: [
        SearchField(),
        ValueListenableBuilder<String>(
            valueListenable: query,
            builder: (BuildContext context, String value, Widget? _) {
              return Container(
                child: Expanded(
                  child: SearchableListView(value, widget.contentList),
                ),
              );
            })
      ]),
    );
  }
}

class SearchField extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (s) => query.value = controller.text,
      style: TextStyle(fontSize: 24),
      decoration: InputDecoration(
          hintText: 'Поиск',
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          suffixIcon: IconButton(
              onPressed: () {
                query.value = controller.text;
                //print(query.value);
              },
              icon: Icon(
                Icons.search,
                color: Colors.blue,
              ))),
    );
  }
}

// ignore: must_be_immutable
class TabItem extends StatelessWidget {
  final String name;
  final String picture;
  final int set;
  final DetailsScreen details;
  int colorIndex = 0;

  TabItem(this.name, this.picture, this.set, this.details);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (buildContext) => details)),
      child: Container(
          color: (colorIndex % 2 == 0) ? Colors.white : Colors.blueGrey.shade50,
          height: 100,
          child: Row(
            children: [
              Image.asset(
                picture,
                height: 100,
                fit: BoxFit.fitHeight,
                filterQuality: FilterQuality.none,
              ),
              Text(
                name,
                style: TextStyle(fontFamily: 'Thintel', fontSize: 64),
              ),
            ],
          )),
    );
  }
}

abstract class DetailsScreen extends StatelessWidget {
  const DetailsScreen();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class SearchableListView extends StatefulWidget {
  final String _query;
  final List<TabItem> _content;
  SearchableListView(this._query, this._content);

  @override
  _SearchableListViewState createState() => _SearchableListViewState();
}

class _SearchableListViewState extends State<SearchableListView> {
  List<TabItem> prepareContent(List<TabItem> contentList, String query) {
    var l = contentList
        .where((element) =>
            element.name.toLowerCase().contains(query.toLowerCase()))
        .toList()
          ..sort((a, b) => a.name.compareTo(b.name));
    for (var i in l) {
      (l.indexOf(i) % 2 == 0) ? i.colorIndex = 0 : i.colorIndex = 1;
    }
    return l;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: prepareContent(widget._content, widget._query),
    );
  }
}
