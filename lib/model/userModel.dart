class UserModel {
  UserModel(
      {required this.Question,
      required this.fullName,
      required this.comments,
      required this.id});
  String Question;
  String fullName;
  List<Map> comments;
  String id;
}
