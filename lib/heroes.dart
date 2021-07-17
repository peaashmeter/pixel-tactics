import 'package:flutter/material.dart';
import 'package:ptapp/search_page.dart';

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

List<TabItem> contentList = [
  TabItem(
      name: 'Рыцарь',
      picture: 'knight',
      set: 1,
      details: HeroDetailsScreen(
        name: 'Рыцарь',
        picture: 'knight',
        atk: 3,
        def: 10,
        vanguard:
            'Перехват. Нанесите 2 урона герою, который выбрал этого героя как цель своей атаки',
        flank: 'Ваш лидер не получает урона от дальних атак',
        rear:
            'Заклинание: переместите до 6 единиц урона с героев в вашем отряде на этого героя',
        order:
            'Нанесите по 4 урона каждому герою и лидеру соперника в ближнем бою',
      )),
  TabItem(
      name: 'Дракон-маг',
      picture: 'dragon_mage',
      set: 1,
      details: HeroDetailsScreen(
        name: 'Дракон-маг',
        picture: 'dragon_mage',
        atk: 6,
        def: 3,
        vanguard: 'Заклинание: герой в ближнем бою повержен',
        flank: 'Позадистоящий получает +3 к силе атаки',
        rear: 'Дальняя атака',
        order:
            'Выбранный герой получает +5 к силе атаки до конца текущей волны',
      )),
  TabItem(
      name: 'Жрица',
      picture: 'priestess',
      set: 1,
      details: HeroDetailsScreen(
          name: 'Жрица',
          picture: 'priestess',
          atk: 1,
          def: 7,
          vanguard: 'Заклинание: исцелите до 4 урона у любого героя.',
          flank: 'Заклинание: исцелите до 2 урона у своего лидера',
          rear:
              'Заклинание: воскресите тело. Жрица получает урон, равный базовым жизням воскрешенного героя',
          order: 'Воскресите тело')),
  TabItem(
      name: 'Берсерк',
      picture: 'berserker',
      set: 1,
      details: HeroDetailsScreen(
          name: 'Берсерк',
          picture: 'berserker',
          atk: 3,
          def: 6,
          vanguard: 'Получает на 1 меньше урона от атак и +2 к силе атаки',
          flank:
              'Герой, который атакует ваш отряд в ближнем бою, получает 2 урона',
          rear:
              'Каждый ход, когда вы в первый раз играете приказ, этот герой совершает свободную дальнюю атаку',
          order:
              'Первый герой в каждом столбце в этом отряде проводит ближнюю атаку, но нельзя атаковать лидера')),
  TabItem(
      name: 'Ученый',
      picture: 'scientist',
      set: 1,
      details: HeroDetailsScreen(
          name: 'Ученый',
          picture: 'scientist',
          atk: 2,
          def: 5,
          vanguard:
              'Заклинание: выберите соперника. Он теряет 1 действие в следующую волну (до мин. 1)',
          flank: 'Заклинание: возьмите 2 карты',
          rear:
              'Заклинание: другой герой в этом отряде совершает ближнюю атаку',
          order: 'Получите 3 дополнительных действия в эту ')),
  TabItem(
      name: 'Алхимик',
      picture: 'alchemist',
      set: 1,
      details: HeroDetailsScreen(
          name: 'Алхимик',
          picture: 'alchemist',
          atk: 2,
          def: 4,
          vanguard: 'Перехват. Получает на 2 урона меньше от атак (мин. 1)',
          flank: 'Ваш лидер получает на 2 урона меньше от атак (мин. 1)',
          rear:
              'Заклинание: нанесите по 1 урону 5 (или меньше) различным героям',
          order:
              'Нанесите 7 урона героям. Вы можете распределить этот урон как хотите')),
  TabItem(
      name: 'Ассассин',
      picture: 'assassin',
      set: 1,
      details: HeroDetailsScreen(
          name: 'Ассассин',
          picture: 'assassin',
          atk: 3,
          def: 1,
          vanguard: 'Базовая сила атаки удваивается против лидеров',
          flank: 'Базовая сила атаки впередистоящего удваивается против героев',
          rear: 'Заклинание: нанесите 3 урона лидеру соперника',
          order: 'Любой герой повержен')),
  TabItem(
      name: 'Двойник',
      picture: 'doppelganger',
      set: 1,
      details: HeroDetailsScreen(
          name: 'Двойник',
          picture: 'doppelganger',
          atk: 3,
          def: 5,
          vanguard:
              'Заклинание: скопируйте базовое заклинание авангарда любого другого героя авангарда',
          flank:
              'Заклинание: скопируйте базовое заклинание фланга любого другого героя авангарда',
          rear:
              'Заклинание: скопируйте базовое заклинание тыла любого другого героя авангарда',
          order: 'Покажите приказ со своей руки и выполните его эффект')),
  TabItem(
      name: 'Повелитель',
      picture: 'overlord',
      set: 1,
      details: HeroDetailsScreen(
          name: 'Повелитель',
          picture: 'overlord',
          atk: 3,
          def: 7,
          vanguard: 'Перехват',
          flank: 'Заклинание: ваш лидер совершает ближнюю атаку',
          rear:
              'Заклинание: любой герой в вашем отряде совершает ближнюю атаку',
          order:
              'Наймите сколько угодно героев в один любой ряд вашего отряда')),
  TabItem(
      name: 'Пиромант',
      picture: 'pyromancer',
      set: 1,
      details: HeroDetailsScreen(
          name: 'Пиромант',
          picture: 'pyromancer',
          atk: 3,
          def: 3,
          vanguard:
              'Заклинание: нанесите по 3 урона каждому герою и лидеру соперника в ближнем бою',
          flank: 'Дальняя атака. Впередистоящий получает дальнюю атаку',
          rear: 'Дальняя атака',
          order:
              'Нанесите по 7 урона всем героям в авангарде во всех отрядах')),
  TabItem(
      name: 'Талисман',
      picture: 'mascot',
      set: 1,
      details: HeroDetailsScreen(
          name: 'Пиромант',
          picture: 'pyromancer',
          atk: 1,
          def: 4,
          vanguard:
              'Заклинание: проведите ближнюю атаку другим героям авангарда в этом отряде',
          flank:
              'Заклинание: проведите дальнюю атаку другим героям фланга в этом отряде',
          rear:
              'Заклинание: проведите дальнюю атаку другим героям тыла в этом отряде',
          order: 'Используйте эффект приказа с карты лидера')),
  TabItem(
      name: 'Ведьма',
      picture: 'witch',
      set: 1,
      details: HeroDetailsScreen(
          name: 'Ведьма',
          picture: 'witch',
          atk: 1,
          def: 5,
          vanguard:
              'Этот герой получает +1 к силе атаки за каждое тело во всех отрядах',
          flank:
              'Если впередистоящий – тело, то этот герой получает +4 к силе атаки',
          rear: 'Заклинание: уберите все тела в одном ряду в любом отряде',
          order: 'Верните все тела одного ряда в руки владельцев')),
  TabItem(
      name: 'Боец',
      picture: 'fighter',
      set: 1,
      details: HeroDetailsScreen(
          name: 'Боец',
          picture: 'fighter',
          atk: 4,
          def: 8,
          vanguard: 'Перехват',
          flank: '+2 к силе атаки',
          rear: '+4 к силе атаки',
          order:
              'Выберите столбец. Нанесите по 5 урона каждому герою в этом столбце во всех отрядах')),
  TabItem(
      name: 'Стрелок',
      picture: 'gunner',
      set: 1,
      details: HeroDetailsScreen(
          name: 'Стрелок',
          picture: 'gunner',
          atk: 5,
          def: 4,
          vanguard: 'Дальняя атака. +3 к силе атаки против героев с перехватов',
          flank: 'Дальняя атака. Позадистоящий получает дальнюю атаку',
          rear: 'Дальняя атака',
          order: 'Нанесите по 5 урона каждому герою в тылу во всех отрядах')),
  TabItem(
      name: 'Целитель',
      picture: 'healer',
      set: 1,
      details: HeroDetailsScreen(
          name: 'Целитель',
          picture: 'healer',
          atk: 1,
          def: 4,
          vanguard: 'Перехват. Получает на 2 урона меньше от атак',
          flank: 'Заклинание: исцелите до 4 урона у любого героя',
          rear:
              'Заклинание: выберите 3 разных героев. Исцелите до 2 урона у каждого из них',
          order:
              'Исцелите до 10 урона. Распределите это исцеление между героями как хотите')),
  TabItem(
      name: 'Гомункул',
      picture: 'homunculus',
      set: 1,
      details: HeroDetailsScreen(
          name: 'Гомункул',
          picture: 'homunculus',
          atk: 3,
          def: 7,
          vanguard: 'Перехват. +2 к силе атаки',
          flank:
              'Заклинание: переместите до 7 урона с героев в вашем отряде на этого героя',
          rear:
              'Когда герой в тылу вашего отряда должен получить урон, вы можете переместить этот урон на этого героя',
          order: 'Совершите перераспределение героев и тел как хотите')),
  TabItem(
      name: 'Ловчий',
      picture: 'trapper',
      set: 1,
      details: HeroDetailsScreen(
          name: 'Ловчий',
          picture: 'trapper',
          atk: 4,
          def: 5,
          vanguard: 'Перехват. Этот герой не получает урон от дальних атак',
          flank:
              'Впередистоящий получает перехват. Позадистоящий получает дальнюю атаку',
          rear:
              'Заклинание: выбранный соперник должен сбросить случайную карту',
          order: 'Выбранный соперник должен сбросить 3 случайные карты')),
  TabItem(
      name: 'Вампир',
      picture: 'vampire',
      set: 1,
      details: HeroDetailsScreen(
          name: 'Вампир',
          picture: 'vampire',
          atk: 2,
          def: 6,
          vanguard:
              'Когда этот герой наносит урон, он исцеляет себе такое же количество жизней',
          flank:
              'Когда впередистоящий получает урон, вы можете перенести этот урон на этого героя',
          rear:
              'Заклинание: переместите до 2 урона со своего лидера на любого героя',
          order:
              'Переместите весь урон с одного героя на любого другого героя')),
  TabItem(
      name: 'Паладин',
      picture: 'paladin',
      set: 1,
      details: HeroDetailsScreen(
          name: 'Паладин',
          picture: 'paladin',
          atk: 4,
          def: 6,
          vanguard: 'Перехват',
          flank:
              'Заклинание: поменяйте местами двух героев и/или тела в своем отряде',
          rear: 'Заклинание: поменяйте двух героев и/или тела соперника',
          order:
              'Свободно перераспределите героев и/или тела в одном столбце любого отряда')),
  TabItem(
      name: 'Оракул',
      picture: 'oracle',
      set: 1,
      details: HeroDetailsScreen(
          name: 'Оракул',
          picture: 'oracle',
          atk: 2,
          def: 4,
          vanguard:
              'Посмотрите карты на руке соперника. Выберите и сбросьте одну из них',
          flank:
              'Заклинание: посмотрите верхние 5 карт своей колоды. Верните их на верх колоды в любом порядке',
          rear: 'Вы можете свободно просматривать верхнюю карту своей колоды',
          order:
              'Сбросьте все карты с руки и возьмите из колоды на одну карту больше. (Эта карта в счет не идет)')),
  TabItem(
      name: 'Призыватель',
      picture: 'summoner',
      set: 1,
      details: HeroDetailsScreen(
          name: 'Призыватель',
          picture: 'summoner',
          atk: 2,
          def: 5,
          vanguard:
              'Заклинание: верните героя, находящегося в ближнем бою, в руку его владельца',
          flank:
              'Заклинание: наймите героя в любую свободную область в вашем отряде',
          rear:
              'Заклинание: возьмите 3 карты. Заберите одну в руку, одну положите на верх своей колоды, одну сбросьте',
          order:
              'Назовите карту. Поищите ее в своей колоде. Если нашли, покажите и возьмите в руку. Затем перемешайте колоду')),
  TabItem(
      name: 'Мистик',
      picture: 'mystic',
      set: 1,
      details: HeroDetailsScreen(
          name: 'Мистик',
          picture: 'mystic',
          atk: 1,
          def: 7,
          vanguard: 'Перехват. Заклинание: исцелите весь урон и с этого героя',
          flank:
              'Впередистоящий получает +2 к силе атаки и на 1 урон меньше от атак',
          rear:
              'Заклинание: возьмите карту. Вы можете разыграть ее как приказ или забрать в руку',
          order:
              'Получите 3 действия. Вы можете потратить их на розыгрыш приказов, операций или ловушек')),
  TabItem(
      name: 'Храмовник',
      picture: 'templar',
      set: 1,
      details: HeroDetailsScreen(
          name: 'Храмовник',
          picture: 'templar',
          atk: 1,
          def: 6,
          vanguard:
              'Этот герой получает +1 к силе атаки за каждую единицу урона на нем',
          flank: 'Позадистоящий не получает урона от атак',
          rear:
              'Заклинание: поменяйте местами этого и другого своего героя в ближнем бою, а затем проведите храмовником ближнюю атаку',
          order:
              'Любой герой, который атакует или атаковал ваш отряд ближней атакой в эту волну, повержен')),
  TabItem(
      name: 'Иллюзионист',
      picture: 'illusionist',
      set: 1,
      details: HeroDetailsScreen(
          name: 'Иллюзионист',
          picture: 'illusionist',
          atk: 4,
          def: 5,
          vanguard:
              'Заклинание: верните героя из своего отряда в руку владельца',
          flank:
              'Заклинание: выберите соперника. Он показывает карту с руки. Выполните ее приказ. Карта остается у соперника',
          rear:
              'Заклинание: наймите героя со своей руки, атакуйте или сотворите заклинание им, а затем сбросьте его',
          order:
              'Возьмите случайную карту с руки соперника, выполните ее приказ, а затем сбросьте')),
  TabItem(
      name: 'Сталкер',
      picture: 'planestalker',
      set: 1,
      details: HeroDetailsScreen(
          name: 'Сталкер',
          picture: 'planestalker',
          atk: 3,
          def: 7,
          vanguard: 'Перехват. Дальняя атака',
          flank: 'Впереди- и позадистоящие получают дальнюю атаку',
          rear: 'Дальняя атака',
          order:
              'Нанесите по 5 урона каждому герою на флангах во всех отрядах'))
];
