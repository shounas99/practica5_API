import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  //Para leer mis argumentos
  final comic = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
  
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(),
              _Overview()
            ])
          )
        ],
      )
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Para leer mis argumentos
    final comic = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
  
    return SliverAppBar(
      backgroundColor: Colors.red,
      expandedHeight: 200,
      floating: false,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: Text(
            '${comic['title']}',
            style: TextStyle(fontSize: 16.0),
          ),
        ),

        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('${comic['path']}.${comic['extension']}'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

//Poster y titulo
class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     //Para leer mis argumentos
    final comic = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: comic['id'],
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage('${comic['path']}.${comic['extension']}'),
                height: 250,
              )
            ),
          ),

          SizedBox(width: 20,),

          ConstrainedBox(
            constraints: BoxConstraints( maxWidth: size.width - 250),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${comic['title']}', style: Theme.of(context).textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2,),
                Row(
                  children: [
                    const Icon(Icons.note_outlined, size: 15, color: Colors.blue,),
                    const SizedBox(width: 5,),
                    Text('Págs.- ${comic['pageCount']}', style:Theme.of(context).textTheme.caption)
                  ],
                )
          
              ],
            ),
          )

        ],
      ),
    );
  }
}


//Descripcion
class _Overview extends StatelessWidget {
  const _Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Para leer mis argumentos
    final comic = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        '${comic['description']}',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
        ),
        

    );
  }
}

