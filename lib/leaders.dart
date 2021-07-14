import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:ptapp/search_page.dart';

class LeadersPage extends SearchPage {
  LeadersPage() : super(contentList, 'Лидеры');
}

class LeadersDetailsScreen extends DetailsScreen {
  final String name;
  final String hero;
  final String picture;
  final int atk;
  final int def;
  final int description;

  const LeadersDetailsScreen({
    required this.name,
    required this.hero,
    required this.picture,
    required this.atk,
    required this.def,
    required this.description,
  });
}

List<TabItem> contentList = [];
