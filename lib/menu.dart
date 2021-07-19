import 'package:flutter/material.dart';
import 'package:ptapp/heroes.dart';
import 'package:ptapp/leaders.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Image.asset('assets/logo/logo.png'),
          color: Colors.blueGrey.shade50,
        ),
        Divider(
          height: 1,
          thickness: 3,
          color: Colors.black87,
        ),
        GestureDetector(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (buildContext) => HeroesPage())),
          child: Container(
            height: 100,
            //color: Colors.white,
            child: Row(
              children: [
                Image.asset(
                  'assets/heropics/knight.png',
                  height: 100,
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.none,
                ),
                Text(
                  'Герои',
                  style: TextStyle(fontFamily: 'Thintel', fontSize: 64),
                )
              ],
            ),
          ),
        ),
        Divider(
          height: 1,
          thickness: 3,
          color: Colors.black87,
        ),
        GestureDetector(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (buildContext) => LeadersPage())),
          child: Container(
              height: 100,
              //color: Colors.blueGrey.shade50,
              child: Row(
                children: [
                  Image.asset(
                    'assets/heropics/dragon_mage.png',
                    height: 100,
                    fit: BoxFit.fill,
                    filterQuality: FilterQuality.none,
                  ),
                  Text(
                    'Лидеры',
                    style: TextStyle(fontFamily: 'Thintel', fontSize: 64),
                  )
                ],
              )),
        ),
        Divider(
          height: 1,
          thickness: 3,
          color: Colors.black87,
        ),
      ],
    );
  }
}
