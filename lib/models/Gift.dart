class Gift{
  final String id;
  final String url;
  final String username;

  Gift({
      required this.id,
      required this.url,
      required this.username
  });

  factory Gift.fromJson(Map<String, dynamic> json){
    return Gift(
      id: json['id'].toString(),
      url: json['images']["original"]?["url"] ?? '',
      username: json['username']?? ''
    );
  }

}