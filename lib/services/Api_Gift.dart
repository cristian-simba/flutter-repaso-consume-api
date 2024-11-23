import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:repaso/models/Gift.dart';

class ApiGift{
  final String api = "https://api.giphy.com/v1/gifs/trending?api_key=Yk0po7aNHq3dOHEWlIMrNDoLE2gejL4r&limit=25&offset=0&rating=g&bundle=messaging_non_clips";
  late Uri api_gift = Uri.parse(api);

  Future<List<Gift>> fetchPhotos() async{
    final response = await http.get(api_gift);
    if(response.statusCode == 200){
      List data = json.decode(response.body)['data'];
      return data.map((giftJson) => Gift.fromJson(giftJson)).toList();
    }else{
      throw Exception("Fallido");
    }
  }
}