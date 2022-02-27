class ApiData {
  final int userId;
  final int id;
  final String title;

  const ApiData({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory ApiData.fromJson(Map<String, dynamic> json) {
    return ApiData(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
