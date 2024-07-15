class QuestionsModel {
  final int id;
  final String description;
  bool result;

  QuestionsModel(
      {required this.id, required this.description, this.result = false});
}
