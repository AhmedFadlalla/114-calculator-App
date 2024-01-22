class UserData{

  final String name;
  final int age;

  final String image;
  UserData({required this.name,required this.age,
  required this.image});
}

class Post{
  final UserData userData;
  final int id;
  final String title;
  final String image;
  Post({required this.userData,required this.id,required this.title,required this.image});
}
