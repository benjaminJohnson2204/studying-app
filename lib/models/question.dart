import 'package:craneapp/models/category.dart';

import 'option.dart';

class Question {
  final String text;
  final String id;
  final String categoryId;
  final List<dynamic> options;
  Question(
      {required this.text,
      required this.id,
      required this.categoryId,
      required this.options});
}
