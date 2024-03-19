// import 'package:dots_indicator/dots_indicator.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:jan_2024_studio/utilities/dimensions.dart';
//
// class MainPageBody extends StatefulWidget {
//   const MainPageBody({super.key});
//
//   @override
//   State<MainPageBody> createState() => _MainPageBodyState();
// }
//
// class _MainPageBodyState extends State<MainPageBody> {
//   PageController pageController = PageController(viewportFraction: 0.85);
//   var _currPageValue = 0.0;
//   final double _scaleFactor = 0.8;
//   final _height = 220;
//
//
//   final _future = Supabase.instance.client
//       .from('countries')
//       .select('name')
//       .select<List<Map<dynamic, dynamic>>>();
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     pageController.addListener(() {
//       setState(() {
//         _currPageValue = pageController.page!;
//         //print('Current Page value = '+ _currPageValue.toString());
//       });
//     });
//   }
//
// // dispose method is to clean the Cache from unwanted data
//   @override
//   void dispose() {
//     super.dispose();
//     pageController.dispose();
//   }
//   @override
//     Widget build(BuildContext context) {
//
//
//
//     // print('Screen Height ='+MediaQuery.of(context).size.height.toString());
//     // print('Screen Width ='+MediaQuery.of(context).size.width.toString());
//
//
//
//
//
//     return Column(
//         children: [
//           Container(
//          //margin: const EdgeInsets.only(left: 25, right: 25),
//            padding: const EdgeInsets.only(top: 0, bottom: 0),
//            decoration: BoxDecoration(
//             image: const DecorationImage(
//             image: AssetImage('assets/images/white4.jpg'),),
//              borderRadius: BorderRadius.circular(25),
//               color: Colors.white,
//            ),
//               height: Dimensions.pageViewBackgroundContainer,
//
//
//             ////////////////////PageView.Builder
//
//
//             child: PageView.builder(
//               controller: pageController,
//               itemCount: 10,
//               itemBuilder: (context, snapshot){
//                 return _buildPageItem(snapshot);
//             }
//             ),
//             ),
//
//             DotsIndicator(
//                 dotsCount: 10,
//                 position: _currPageValue.toInt(),
//                 decorator: DotsDecorator(
//                   activeColor: Colors.deepPurple,
//                   color: const Color(0xFFA8A3C1),
//                   size: const Size.square(9.0),
//                   activeSize: const Size(18.0, 9.0),
//                   activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
//               ),
//             ),
//             SizedBox(height: Dimensions.height10),
//
//           Container(
//             margin: const EdgeInsets.only(left: 20),
//             child: Row(
//               children: [
//               Text('Popular', style: GoogleFonts.ubuntu(
//               fontWeight: FontWeight.bold,
//                 fontSize: 18,
//                 color: const Color(0xFF747384),
//                   ),
//                 ),
//               SizedBox(width: Dimensions.width10),
//               Container(
//                 margin: const EdgeInsets.only(bottom: 12),
//                   child: const Text(
//                       '.',
//                       style:TextStyle(
//                           fontSize: 30,
//                       ),
//                   ),
//               ),
//                 SizedBox(width: Dimensions.width10),
//               Container(
//                 margin: const EdgeInsets.only(top: 4),
//                 child: Text('Car Pairing', style: GoogleFonts.ubuntu(
//                 fontWeight: FontWeight.normal,
//                 color: const Color(0xFFA8A3C1),
//                   ),
//                 ),
//               ),
//             ]
//         ),
//           ),
//
//
//
//
//           FutureBuilder<List<Map<dynamic, dynamic>>>(
//             future: _future,
//             builder: (context, snapshot) {
//               if (!snapshot.hasData) {
//                 return const Center(child: CircularProgressIndicator());
//               }
//               final countries = snapshot.data!;
//               return ListView.builder(
//                 itemCount: countries.length,
//                 physics: const NeverScrollableScrollPhysics(), //////
//                 shrinkWrap: true, /////
//                 itemBuilder: ((context, index) {
//                   final country = countries[index];
//
//
//                   return Container(
//                     margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height10),
//                     child: Row(
//                       children: [
//                         Container(
//                           height: Dimensions.height120,
//                           width: Dimensions.height120,
//                           margin: EdgeInsets.only(right: Dimensions.width15),
//                           // color: Colors.white38,
//                           decoration:  BoxDecoration(
//                             color: Colors.white10,
//                             image: DecorationImage(
//                                 image: NetworkImage(country['Image']),
//                                 fit: BoxFit.cover
//                             ),
//                             borderRadius: BorderRadius.circular(Dimensions.height15),
//                           ),
//                         ),
//                         Expanded(
//                           child: Container(
//                             //margin: EdgeInsets.only(left: Dimensions.width40),
//                             height: Dimensions.height100,
//                             decoration: const BoxDecoration(
//                               borderRadius: BorderRadius.only(
//                                   topRight: Radius.circular(10),
//                                   bottomRight: Radius.circular(10)),
//                               color: Colors.white,
//                             ),
//                             child: Padding(
//                               padding: EdgeInsets.only(right: Dimensions.width25),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(country['name'], style: GoogleFonts.ubuntu(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 18,
//                                     color: const Color(0xFF747384),
//                                   ),
//                                   ),
//                                   Container(
//                                     margin: EdgeInsets.only(bottom: Dimensions.height10),
//                                     child: Text(
//                                       country['description'],
//                                       style: GoogleFonts.ubuntu(
//                                         fontWeight: FontWeight.normal,
//                                         color: const Color(0xFFA8A3C1),
//                                       ),
//                                       overflow: TextOverflow.fade,
//                                       maxLines: 2,
//                                     ),
//                                   ),
//                                   Container(
//                                     margin: EdgeInsets.only(left: Dimensions.width10),
//                                     child: Row(
//                                       children: [
//                                         const Icon(
//                                             Icons.favorite_rounded, color: Colors.red),
//                                         const SizedBox(width: 5),
//                                         Text(country['id'].toString(), style: GoogleFonts.ubuntu(
//                                             color: const Color(0xFFA8A3C1), fontWeight: FontWeight.normal)),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//
//
//
//                   // return ListTile(
//                   //   subtitle: Text(country['description']),
//                   //   trailing: Text(country['price'].toString()),
//                   //   leading: Container(
//                   //                 height: Dimensions.height120,
//                   //                 width: Dimensions.height120,
//                   //                 margin: EdgeInsets.only(right: Dimensions.width15),
//                   //                   // color: Colors.white38,
//                   //                   decoration:  BoxDecoration(
//                   //                     color: Colors.white10,
//                   //                   image: DecorationImage(
//                   //                       image:NetworkImage(country['Image']),
//                   //                       fit: BoxFit.cover
//                   //                   ),
//                   //                   borderRadius: BorderRadius.circular(Dimensions.height15),
//                   //                   ),
//                   //                 ),
//                   //   //leading: Image.network(country['Image']),
//                   //   textColor: Colors.deepPurple,
//                   //   title: Text(
//                   //     country['name'],
//                   //     style: GoogleFonts.kanit(
//                   //       textStyle: Theme.of(context).textTheme.displayLarge,
//                   //       fontSize: 18,
//                   //       fontStyle: FontStyle.italic,
//                   //     ),
//                   //   ),
//                   // );
//
//
//
//
//
//                 }),
//               );
//             },
//           ),
//
//
//
//
//
//
//           // ListView.builder(
//           //     physics: const NeverScrollableScrollPhysics(),
//           //     shrinkWrap: true,
//           //       itemCount: 10,
//           //       itemBuilder: (context, index){
//           //         return Container(
//           //           margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height10),
//           //           child: Row(
//           //             children: [
//           //               Container(
//           //                 height: Dimensions.height120,
//           //                 width: Dimensions.height120,
//           //                 margin: EdgeInsets.only(right: Dimensions.width15),
//           //                   // color: Colors.white38,
//           //                   decoration:  BoxDecoration(
//           //                     color: Colors.white10,
//           //                   image: const DecorationImage(
//           //                       image: NetworkImage('https://images.pexels.com/photos/2098498/pexels-photo-2098498.jpeg?auto=compress&cs=tinysrgb&w=800'),
//           //                       fit: BoxFit.cover
//           //                   ),
//           //                   borderRadius: BorderRadius.circular(Dimensions.height15),
//           //                   ),
//           //                 ),
//           //               Expanded(
//           //               child: Container(
//           //                 //margin: EdgeInsets.only(left: Dimensions.width40),
//           //                 height: Dimensions.height100,
//           //                 decoration: const BoxDecoration(
//           //                   borderRadius: BorderRadius.only(
//           //                       topRight: Radius.circular(10),
//           //                       bottomRight: Radius.circular(10)),
//           //                   color: Colors.white,
//           //                 ),
//           //                 child: Padding(
//           //                   padding: EdgeInsets.only(right: Dimensions.width25),
//           //                   child: Column(
//           //                     crossAxisAlignment: CrossAxisAlignment.center,
//           //                     children: [
//           //                       Text('Rolls Royce Phantom', style: GoogleFonts.ubuntu(
//           //                         fontWeight: FontWeight.bold,
//           //                         fontSize: 18,
//           //                         color: const Color(0xFF747384),
//           //                       ),
//           //                       ),
//           //                       Container(
//           //                         margin: EdgeInsets.only(bottom: Dimensions.height10),
//           //                         child: Text(
//           //                           'Car Pairing is a Great mobile app that returns a valuable benefits. Something to Do: 1- Go a head, 2- Go back, 3- By the way.',
//           //                           style: GoogleFonts.ubuntu(
//           //                               fontWeight: FontWeight.normal,
//           //                               color: const Color(0xFFA8A3C1),
//           //                           ),
//           //                           overflow: TextOverflow.fade,
//           //                           maxLines: 2,
//           //                         ),
//           //                       ),
//           //                       Container(
//           //                         margin: EdgeInsets.only(left: Dimensions.width10),
//           //                         child: Row(
//           //                           children: [
//           //                             const Icon(
//           //                                 Icons.favorite_border_rounded, color: Colors.red),
//           //                             const SizedBox(width: 5),
//           //                             Text('4.1', style: GoogleFonts.ubuntu(
//           //                                 color: const Color(0xFFA8A3C1), fontWeight: FontWeight.normal)),
//           //                           ],
//           //                         ),
//           //                       ),
//           //                     ],
//           //                   ),
//           //                 ),
//           //               ),
//           //               ),
//           //             ],
//           //           ),
//           //         );
//           //       }
//           //
//           //   ),
//       ]
//     );
//   }
//
//   Widget _buildPageItem(int index) {
//
//     Matrix4 matrix = Matrix4.identity();
//     if (index == _currPageValue.floor()) {
//       var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
//       var currTrans = _height * (1 - currScale) / 2;
//       matrix = Matrix4.diagonal3Values(1, currScale, 1)
//         .. setTranslationRaw(0, currTrans, 0);
//     } else if (index == _currPageValue.floor() + 1) {
//       var currScale = _scaleFactor +
//           (_currPageValue - index + 1) * (1 - _scaleFactor);
//       var currTrans = _height * (1 - currScale) / 2;
//       matrix = Matrix4.diagonal3Values(1, currScale, 1);
//       matrix = Matrix4.diagonal3Values(1, currScale, 1)
//         .. setTranslationRaw(0, currTrans, 0);
//     } else if (index == _currPageValue.floor() - 1) {
//       var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
//       var currTrans = _height * (1 - currScale) / 2;
//       matrix = Matrix4.diagonal3Values(1, currScale, 1);
//       matrix = Matrix4.diagonal3Values(1, currScale, 1)
//         .. setTranslationRaw(0, currTrans, 0);
//     } else {
//       var currScale = 0.8;
//       matrix = Matrix4.diagonal3Values(1, currScale, 1)
//         .. setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
//     }
//
//
//     return Transform(
//       transform: matrix,
//       child: Stack(
//           alignment: Alignment.center,
//           children: [
//             Positioned(
//               left: 0,
//               child: Container(
//                 height: Dimensions.pageViewContainer,
//                 width: 340,
//                 margin: const EdgeInsets.only(left: 0, right: 0, top: 0),
//                 decoration: BoxDecoration(
//                   boxShadow: const [
//                     BoxShadow(
//                       color: Colors.grey,
//                       blurRadius: 10,
//                       offset: Offset(0, 5),
//                     ),
//                   ],
//                   color: index.isEven ? Colors.deepPurple : Colors.grey,
//                   borderRadius: BorderRadius.circular(15),
//                   image: const DecorationImage(
//                     image: NetworkImage(
//                         'https://images.pexels.com/photos/112460/pexels-photo-112460.jpeg'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               left: 10,
//               bottom: 55,
//               child: Row(
//                 children: [
//                   const Icon(
//                       Icons.favorite_rounded, color: Colors.red),
//                   const SizedBox(width: 5),
//                   Text('4.3', style: GoogleFonts.ubuntu(
//                       color: Colors.white, fontWeight: FontWeight.normal)),
//                 ],
//               ),
//             ),
//           ]
//       ),
//     );
//   }
// }
