import 'package:flutter/material.dart';
import 'package:ptapp/search_page.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:convert';

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

  // LeaderDetailsScreen.fromJson(Map<String, dynamic> json)
  //     : name = json['name'],
  //       hero = json['hero'],
  //       picture = json['picture'],
  //       atk = json['atk'],
  //       def = json['def'],
  //       ability = json['ability'],
  //       title = json['title'];

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
            Row(
              children: [
                Expanded(
                    child: Container(
                  height: 50,
                ))
              ],
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

Future<Map<String, dynamic>> readJson(path) async {
  String jsonAsString = await rootBundle.loadString(path);
  return jsonDecode(jsonAsString) as Map<String, dynamic>;
}

List<TabItem> contentList = [
  TabItem(
      name: 'Каденза',
      picture: 'knight',
      set: 1,
      details: LeaderDetailsScreen(
        name: 'Каденза',
        picture: 'knight',
        hero: 'Рыцарь',
        atk: 4,
        def: 20,
        ability: 'Ваши герои и лидер получают на 1 меньше урона от атак',
        title: 'Механическая пехотная дивизия',
      )),
  TabItem(
      name: 'Заамассал Кетт',
      picture: 'planestalker',
      set: 1,
      details: LeaderDetailsScreen(
          name: 'Заамассал Кетт',
          picture: 'planestalker',
          hero: 'Сталкер',
          atk: 4,
          def: 19,
          ability:
              'Этот лидер обладает дальней атакой. Все герои в этом отряде получают дальнюю атаку.',
          title: 'Сталкеры')),
  TabItem(
      name: 'Арек Рассел Зейн',
      picture: 'illusionist',
      set: 1,
      details: LeaderDetailsScreen(
          name: 'Арек Рассел Зейн',
          picture: 'illusionist',
          hero: 'Иллюзионист',
          atk: 4,
          def: 15,
          ability:
              'Каждый раз, когда герой или лидер соперника совершают ближнюю атаку, вы решаете, какую цель он атакует. (Новая цель должна быть в доступности для ближней атаки).',
          title: 'Призрачный взвод'))
];
