import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:practica5/models/comics_model.dart';
import 'package:practica5/models/thumbnail_model.dart';
import 'package:practica5/network/api_comic.dart';
import 'package:practica5/screens/card_comic.dart';

class ComicScreen extends StatefulWidget {
  ComicScreen({Key? key}) : super(key: key);

  @override
  _ComicScreenState createState() => _ComicScreenState();
}

class _ComicScreenState extends State<ComicScreen> {
  //API COMIC
  ApiComic apiComic = ApiComic();

  //initState
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Container(
          color: Colors.red,
          margin: const EdgeInsets.only(top: 10.0),
          child: const FadeInImage(
            placeholder: AssetImage('assets/no-image.jpg'),
            image: AssetImage('assets/marvel.png')
          )
        ),
        
        preferredSize: const Size.fromHeight(130.0)
      ),
      
      body: FutureBuilder(
        future: apiComic.getAllComics(),
        builder: (BuildContext context,
          AsyncSnapshot<List<ComicsModel>?> snapshot){
            if(snapshot.hasError){
              return const Center(
                child: Text('Hay un error en la peticion de comics'),
              );
            } else{
              if(snapshot.connectionState == ConnectionState.done){
                return _listComics(snapshot.data);
              } else{
                return const CircularProgressIndicator();
              }
            }
          }
      ),
    );
  }

  Widget _listComics(List<ComicsModel>? comics){
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/white.jpg'),
          fit: BoxFit.cover
        )
      ),
      child: Swiper(
        itemCount: comics!.length, //10
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: ( _, int index){
          //Instanciar lista para acceder a datos
          ComicsModel marvel = comics[index];

          return FutureBuilder(
            future: apiComic.getThumbanil(marvel.id!),
            builder: (BuildContext context,
            AsyncSnapshot<ThumbnailModel?> snapshot){
              if(snapshot.hasError){
                return const Center(
                  child: Text('Hay un error en la peticion de imagenes'),
                );
              } else{
                if(snapshot.connectionState == ConnectionState.done){
                  return _comic(snapshot.data, marvel);
                } else{
                  return const CircularProgressIndicator();
                }
              }
            }
          );
        }
      ),
    );      
  }

  Widget _comic(ThumbnailModel? thumbnail, ComicsModel comic) {
    final size = MediaQuery.of(context).size;
    
    return Container(
      
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
          context, 'details',
          arguments: {
            'id' : comic.id,
            'title' : comic.title,
            'description': comic.description,
            'pageCount'  : comic.pageCount,
            'path'       : thumbnail!.path,
            'extension'  : thumbnail.image_extension
          }
    
        ),
        child: Hero(
          tag: comic.id!,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage('${thumbnail!.path}.${thumbnail.image_extension}'),
              fit: BoxFit.cover,
            ),
          ),
          
        ),
      ),
    );
  }

}