import 'package:flutter/material.dart';
import 'package:ptapp/search_page.dart';
import 'json_handler.dart' as jsonHandler;

class LeadersPage extends SearchPage {
  LeadersPage() : super(contentList, 'Лидеры');
}

class LeaderDetailsScreen extends DetailsScreen {
  final String name;
  final String picture;
  final String hero;
  final int atk;
  final int def;
  final String ability;
  final String title;

  LeaderDetailsScreen(
      {required this.name,
      required this.picture,
      required this.hero,
      required this.atk,
      required this.def,
      required this.ability,
      required this.title});

  Widget build(BuildContext context) {
    return DetailsWidget(
        picture: picture,
        name: name,
        atk: atk,
        def: def,
        title: title,
        ability: ability);
  }
}

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({
    Key? key,
    required this.picture,
    required this.name,
    required this.atk,
    required this.def,
    required this.title,
    required this.ability,
  }) : super(key: key);

  final String picture;
  final String name;
  final int atk;
  final int def;
  final String title;
  final String ability;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Информация'),
        ),
        body: Column(
          children: [
            Container(
              height: 100,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/heropics/$picture.png',
                        height: 100,
                        fit: BoxFit.fitHeight,
                        filterQuality: FilterQuality.none,
                      ),
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(name,
                              style: TextStyle(
                                  fontFamily: 'Thintel', fontSize: 42)),
                        ),
                      ),
                      Stack(alignment: Alignment.center, children: [
                        Image.asset('assets/icons/sword.png'),
                        Text(atk.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              shadows: <Shadow>[
                                Shadow(
                                    color: Colors.black,
                                    offset: Offset(1.5, 1.5),
                                    blurRadius: 2)
                              ],
                              fontFamily: 'Thintel',
                              fontSize: 64,
                              color: Colors.red.shade900,
                            ))
                      ]),
                      Stack(alignment: Alignment.center, children: [
                        Image.asset('assets/icons/shield.png'),
                        Text(def.toString(),
                            style: TextStyle(
                                shadows: <Shadow>[
                                  Shadow(
                                      color: Colors.black,
                                      offset: Offset(1.5, 1.5),
                                      blurRadius: 2)
                                ],
                                fontFamily: 'Thintel',
                                fontSize: 64,
                                color: Colors.blue.shade900)),
                      ]),
                    ]),
              ),
            ),
            Divider(
              height: 1,
              thickness: 3,
              color: Colors.black87,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: 10),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: 'Thintel', fontSize: 32),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              height: 1,
              thickness: 3,
              color: Colors.black87,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: Color(0xffe9ddef),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: 100),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          ability,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: 'Thintel', fontSize: 32),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              height: 1,
              thickness: 3,
              color: Colors.black87,
            ),
            Expanded(
              child: Container(
                color: Color(0xfffbf3ea),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [Text('')],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

List<TabItem> contentList = jsonHandler.leadersList;
