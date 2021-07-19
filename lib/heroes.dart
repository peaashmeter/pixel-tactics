import 'package:flutter/material.dart';
import 'package:ptapp/search_page.dart';
import 'json_handler.dart' as jsonHandler;

class HeroesPage extends SearchPage {
  //final List<TabItem> contentList;
  HeroesPage() : super(contentList, 'Герои');
}

class HeroDetailsScreen extends DetailsScreen {
  final String name;
  final String picture;
  final int atk;
  final int def;
  final String vanguard;
  final String flank;
  final String rear;
  final String order;

  HeroDetailsScreen(
      {required this.name,
      required this.picture,
      required this.atk,
      required this.def,
      required this.vanguard,
      required this.flank,
      required this.rear,
      required this.order});

  @override
  Widget build(BuildContext context) {
    return DetailsWidget(
        picture: picture,
        name: name,
        atk: atk,
        def: def,
        vanguard: vanguard,
        flank: flank,
        rear: rear,
        order: order);
  }
}

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({
    Key? key,
    required this.picture,
    required this.name,
    required this.atk,
    required this.def,
    required this.vanguard,
    required this.flank,
    required this.rear,
    required this.order,
  }) : super(key: key);

  final String picture;
  final String name;
  final int atk;
  final int def;
  final String vanguard;
  final String flank;
  final String rear;
  final String order;

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
                      Text(name,
                          style:
                              TextStyle(fontFamily: 'Thintel', fontSize: 42)),
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
                    color: Color(0xfffee0df),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: 100),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          vanguard,
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
                    color: Color(0xffcee7bd),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: 100),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          flank,
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
                    color: Color(0xffb9e0fa),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: 100),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          rear,
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
                          order,
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

List<TabItem> contentList = jsonHandler.heroesList;
