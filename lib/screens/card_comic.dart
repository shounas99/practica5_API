// //PRUEBA

// import 'package:flutter/material.dart';
// import 'package:practica5/models/comics_model.dart';

// class CardComic extends StatelessWidget {
//   final ComicsModel marvel; //Modelo de comic

//   const CardComic({Key? key, required this.marvel}) : super(key: key);


//   @override
//   Widget build(BuildContext context) {

//     return Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10.0),
//           boxShadow: [
//             BoxShadow(
//                 color: Colors.black87,
//                 offset: Offset(0.0, 5.0),
//                 blurRadius: 2.5)
//           ]),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(10.0),
//         child: Stack(
//           alignment: Alignment.bottomCenter,
//           children: [
//             Container(
//               child: Hero(
//                 tag: marvel.id!,
//                 child: FadeInImage(
//                   placeholder: AssetImage('assets/activity_indicator.gif'),
//                   image: NetworkImage(
//                       'https://via.placeholder.com/300x400'),
//                   fadeInDuration: Duration(milliseconds: 200),
//                 ),
//               ),
//             ),
//             Opacity(
//               opacity: .5,
//               child: Container(
//                 padding: EdgeInsets.only(left: 10.0),
//                 height: 55.0,
//                 color: Colors.black,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(marvel.data!.results, style: TextStyle(color: Colors.white, fontSize: 12.0),),
//                     MaterialButton(
//                       onPressed: () async {

//                         Navigator.pushNamed(
//                           context,
//                           '/detail',
//                           arguments: {
//                             'title'       : marvel.title,
//                           }
//                         );
//                       },
//                       child: Icon(Icons.chevron_right, color: Colors.white,),
//                     )
//                   ],
//                 ),
//               ),
//             ) 
//           ],
//         )
//       ),
//     );
//   }
// }
