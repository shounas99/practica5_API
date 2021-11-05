import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:practica5/models/comics_model.dart';
import 'package:practica5/models/thumbnail_model.dart';

class ApiComic{

   var URL = Uri.parse(
      'http://gateway.marvel.com/v1/public/comics?ts=1&apikey=27227fa996052b245b21d8d22f94f28c&hash=335394844190d0a5eea1d3f60e44b5b5');
  Future<List<ComicsModel>?> getAllComics() async {
    final response = await http.get(URL);
    if (response.statusCode == 200) {
      var marvel = jsonDecode(response.body)['data']['results'] as List;
      List<ComicsModel> listComics =
        marvel.map((comic) => ComicsModel.fromMap(comic)).toList();
      return listComics;
    } else {
      return null;
    }
  }
  //Metodo images
  Future<ThumbnailModel?> getThumbanil(int comicId)async{
   
    var URL = Uri.parse('http://gateway.marvel.com/v1/public/comics/$comicId?&ts=1&apikey=27227fa996052b245b21d8d22f94f28c&hash=335394844190d0a5eea1d3f60e44b5b5');
    
    final response = await http.get(URL);
    if(response.statusCode == 200){
      var images = jsonDecode(response.body)['data']['results'][0]['thumbnail'] as Map<String, dynamic>; //Es solo 1 obj
      ThumbnailModel thumbnail = ThumbnailModel(
        path: images['path'],
        image_extension: images['extension']
      );
      return thumbnail;
    } else{
      return null;
    }

  }
}