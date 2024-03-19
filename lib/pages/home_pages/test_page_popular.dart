// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:expandable_text/expandable_text.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import '../../utilities/app_icons.dart';
// import '../../utilities/dimensions.dart';
// class TestPagePopular extends StatefulWidget {
//   final int id;
//   final String name;
//   final int price;
//   final String description;
//   final String image;
//   final String details;
//   final int piastres;
//   final bool hotItem;
//   final String? hotItemText;
//   final int? priceBefore;
//   final int? stock;
//   final String? package;
//   final String? brand;
//   final String? brandLogo;
//
//   const TestPagePopular({super.key,
//     required this.id,
//     required this.name,
//     required this.image,
//     required this.description,
//     required this.details,
//     required this.price,
//     required this.piastres,
//     required this.hotItem,
//     required this.hotItemText,
//     required this.priceBefore,
//     required this.stock,
//     required this.package,
//     required this.brand,
//     required this.brandLogo});
//
//   @override
//   State<TestPagePopular> createState() => _TestPagePopularState();
// }
//
// class _TestPagePopularState extends State<TestPagePopular> {
//
//   late final int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter + 1;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               width: double.infinity,
//               height: Dimensions.popularProductImageHeight,
//               child: Stack(
//                   children: [
//                     Positioned(
//                         left: 0,
//                         right: 0,
//                         child: Container(
//                           width: 400,
//                           height: Dimensions.popularProductImageHeight,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: NetworkImage(image),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         )
//                     ),
//                     Positioned(
//                       top: Dimensions.height30,
//                       left: Dimensions.width20,
//                       right: Dimensions.width20,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           // InkWell(
//                           //   onTap: () {
//                           //     // do something when the button is tapped},
//                           //   child: Container(
//                           //     color: Colors.blue,
//                           //     width: 100,
//                           //     height: 50,
//                           //     child: const Center(
//                           //       child: Text(
//                           //         'Button',
//                           //         style: TextStyle(
//                           //           color: Colors.white,
//                           //           fontSize: 20,
//                           //         ),
//                           //       ),
//                           //     ),
//                           //   ),
//                           // ),
//
//                           GestureDetector(
//                             onTap: () {
//                               Get.back();
//                               // Get.to(const PopularProductsDetails());
//                             },
//                             child: AppIcons(
//                                 icon: Icons.arrow_back_ios_rounded,
//                                 backgroundColor: const Color(0xFFA8A3C1).withOpacity(0.75)),
//                           ),
//                           AppIcons(
//                             icon: Icons.shopping_cart_outlined,
//                             backgroundColor: const Color(0xFFA8A3C1).withOpacity(0.75),
//                           ),
//                         ],
//                       ),
//                     ),
//
//                     hotItemText.toString() == 'null' ? Container() : Positioned(
//                       left: 0,
//                       top: Dimensions.popularProductImageHeight - Dimensions.height30,
//                       child: Container(
//                         height: Dimensions.height30,
//                         width: 400,
//                         decoration: BoxDecoration(
//                           color: Theme.of(context).colorScheme.onPrimaryContainer,
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               '      ${hotItemText.toString()}',
//                               style: GoogleFonts.ubuntu(
//                                 color: Theme.of(context).colorScheme.onPrimary,
//                                 fontSize: Dimensions.fontSize18,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//
//                   ]
//               ),
//             ),
//
//             Container(
//               padding: EdgeInsets.only(
//                   left: Dimensions.width15,
//                   top: Dimensions.height20),
//               //    right: Dimensions.width20),
//               // decoration: BoxDecoration(
//               //   borderRadius: BorderRadius.only(
//               //     topLeft: Radius.circular(Dimensions.circular30),
//               //     topRight: Radius.circular(Dimensions.circular30),
//               //   ),
//               //   color: Colors.white,
//               // ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   stock! < 5 ? stock == 0 ?  Text('Out of Stock',
//                     textAlign: TextAlign.start,
//                     style: GoogleFonts.ubuntu(
//                       fontWeight: FontWeight.w100,
//                       fontSize: Dimensions.fontSize15,
//                       decoration: TextDecoration.lineThrough,
//                       color: Theme.of(context).colorScheme.error,
//
//                     ),
//                   ) : Text ('only ${stock.toString()} left',
//                     style: GoogleFonts.ubuntu(
//                       fontSize: Dimensions.fontSize15,
//                       color: Colors.red,
//                       fontWeight: FontWeight.w100,
//                     ),
//                   ) : Container(),
//
//                   Text(
//                     name,
//                     // style: Theme.of(context).textTheme.headlineMedium,
//                     style: GoogleFonts.ubuntu(
//                       fontWeight: FontWeight.normal,
//                       fontSize: Dimensions.fontSize24,
//                       color: Theme.of(context).colorScheme.secondary,
//                     ),
//                   ),
//
//                   Row(
//                     children: [
//                       RichText(
//                         text: TextSpan(
//                             children: [
//                               TextSpan(
//                                 text: price.toString(),
//                                 style: GoogleFonts.ubuntu(
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: Dimensions.fontSize24,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: '.${piastres.toString()}',
//                                 style: GoogleFonts.ubuntu(
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: Dimensions.fontSize12,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: '   EGP',
//                                 style: GoogleFonts.ubuntu(
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: Dimensions.fontSize12,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ]
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   hotItem == false ? Container() : Padding(
//                     padding: EdgeInsets.only(left: Dimensions.width10/2),
//                     child: Row(
//                       children: [
//                         AutoSizeText(
//                           '$priceBefore',
//                           maxLines: 1,
//                           overflow: TextOverflow.fade,
//                           style: GoogleFonts.kanit(
//                             color: Theme.of(context).colorScheme.secondary,
//                             decoration: TextDecoration.lineThrough,
//                             fontSize: Dimensions.fontSize20,
//                           ),
//                         ),
//
//                         hotItem == false ? Container() :  AutoSizeText(
//                           '  ${(((priceBefore! / price) - 1) * 100 ).toStringAsFixed(0)}%  Discount',
//                           overflow: TextOverflow.fade,
//                           maxLines: 1,
//                           style: GoogleFonts.kanit(
//                             color: Theme.of(context).colorScheme.primary,
//                             fontWeight: FontWeight.w400,
//                             fontSize: Dimensions.fontSize20,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   Container(
//                     // margin: EdgeInsets.only(left: Dimensions.width10),
//                     child: Row(
//                       children: [
//                         const Icon(Icons.favorite_rounded, color: Colors.red),
//                         SizedBox(width: Dimensions.width10/2),
//                         Text((id.toString()),
//                             style: GoogleFonts.ubuntu(
//                                 color: Theme.of(context).colorScheme.secondary,
//                                 fontWeight: FontWeight.normal)),
//                       ],
//                     ),
//                   ),
//
//                   Container(
//                     height: Dimensions.height50,
//                     width: double.infinity,
//                     decoration: const BoxDecoration(
//                       color: Color(0xfff3edf7),
//                       //  borderRadius: BorderRadius.circular(Dimensions.circular10),
//                     ),
//                     margin: EdgeInsets.only(bottom: Dimensions.height10, right: Dimensions.width10),
//                     child: Row(
//                       children: [
//                         Container(
//                           width: Dimensions.width70,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: NetworkImage(image.toString()),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//
//                         Text(
//                           '   ${brand.toString()}   |',
//                           style: GoogleFonts.ubuntu(
//                             fontSize: Dimensions.fontSize16,
//                             fontWeight: FontWeight.w500,
//                             color: Theme.of(context).colorScheme.primary,
//                           ),
//                           overflow: TextOverflow.fade,
//                           maxLines: 1,
//                         ),
//                         Divider(
//                           height: Dimensions.height40,
//                           color: Theme.of(context).colorScheme.error,
//                           thickness: Dimensions.width10,
//                         ),
//                       ],
//                     ),
//                   ),
//
//
//                   Container(
//                     padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
//                     margin: EdgeInsets.only( right: Dimensions.width10),
//                     decoration: BoxDecoration(
//                       color: const Color(0xfff3edf7),
//                       borderRadius: BorderRadius.circular(Dimensions.circular10),
//                       //border: Border.all(),
//                     ),
//                     child: ExpandableText(
//                       maxLines: 2,
//                       details,
//                       expandText: 'show more',
//                       collapseText: 'Less',
//                       style: GoogleFonts.ubuntu(
//                         color: Theme.of(context).colorScheme.secondary,
//                         fontSize: Dimensions.fontSize14,
//                       ),
//                       linkStyle: TextStyle(
//                         color: Theme.of(context).colorScheme.primary,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       animation: true,
//                       collapseOnTextTap: true,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             Padding(
//               padding: EdgeInsets.only(top: Dimensions.height10),
//               child: Text(
//                 '    Similar Items',
//                 textAlign: TextAlign.start,
//                 style: GoogleFonts.kanit(
//                   color: Colors.black,
//                   fontSize: Dimensions.fontSize20,
//                 ),
//               ),
//             ),
//
//             Flexible(
//               fit: FlexFit.loose,
//               child: FutureBuilder<List<Map<String, dynamic>>>(
//                 future: _future,
//                 builder: (context, snapshot) {
//                   if (!snapshot.hasData) {
//                     return const Center(); //child: CircularProgressIndicator());
//                   }
//                   final countries = snapshot.data!;
//                   return ListView.builder(
//                     itemCount: countries.length,
//                     physics: const NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     itemBuilder: ((context, index) {
//                       final country = countries[index];
//                       return Container(
//                         color: Colors.transparent,
//                         margin: EdgeInsets.only(
//                           // top: Dimensions.height10,
//                             left: Dimensions.width10,
//                             right: Dimensions.width10,
//                             bottom: Dimensions.height10
//                         ),
//                         child: Row(
//                           children: [
//                             Container(
//                               height: Dimensions.height120,
//                               width: Dimensions.height120,
//                               margin: EdgeInsets.only(
//                                   right: Dimensions.width15),
//                               // color: Colors.white38,
//                               decoration: BoxDecoration(
//                                 color: Colors.transparent,
//                                 image: DecorationImage(
//                                     image:
//                                     NetworkImage(country['image']),
//                                     fit: BoxFit.cover),
//                                 borderRadius: BorderRadius.circular(
//                                     Dimensions.height15),
//                               ),
//                             ),
//                             Expanded(
//                               child: Container(
//                                 //margin: EdgeInsets.only(left: Dimensions.width40),
//                                 height: Dimensions.height120,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.only(
//                                       topRight: Radius.circular(Dimensions.height10),
//                                       bottomRight: Radius.circular(Dimensions.height10)),
//                                   color: Colors.transparent,
//                                 ),
//                                 child: Padding(
//                                   padding: EdgeInsets.only(
//                                       right: Dimensions.width25),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         country['name'],
//                                         style: GoogleFonts.ubuntu(
//                                           fontWeight: FontWeight.w500,
//                                           fontSize:
//                                           Dimensions.fontSize18,
//                                           color:
//                                           const Color(0xFF747384),
//                                         ),
//                                       ),
//                                       Expanded(
//                                         child: Container(
//                                           color: Colors.transparent,
//                                           margin: EdgeInsets.only(
//                                               bottom:
//                                               Dimensions.height10),
//                                           child: AutoSizeText(
//                                             country['details'],
//                                             style: GoogleFonts.ubuntu(
//                                               fontWeight:
//                                               FontWeight.normal,
//                                               color:
//                                               const Color(0xFFA8A3C1),
//                                             ),
//                                             overflow: TextOverflow.fade,
//                                             maxLines: MediaQuery.of(context).size.height > 690 ? 4 : 2,
//                                           ),
//                                         ),
//                                       ),
//                                       Container(
//                                         margin: EdgeInsets.only(
//                                             left: Dimensions.width10),
//                                         child: Row(
//                                           children: [
//                                             const Icon(
//                                               Icons.favorite_rounded,
//                                               color: Colors.red,
//                                             ),
//                                             SizedBox(
//                                                 width:
//                                                 Dimensions.width10 /
//                                                     2),
//                                             Text(
//                                               country['id']
//                                                   .toString(),
//                                               style: GoogleFonts.ubuntu(
//                                                   color: const Color(
//                                                       0xFFA8A3C1),
//                                                   fontWeight:
//                                                   FontWeight.normal),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     }),
//                   );
//                 },
//               ),
//             ),
//
//           ],
//         ),
//       ),
//       bottomNavigationBar: Container(
//         margin: EdgeInsets.only(
//             left: Dimensions.width10, right: Dimensions.width10),
//         height: Dimensions.height50,
//         width: Dimensions.width120 * 3,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(Dimensions.circular15),
//           color: Colors.transparent,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Container(
//               width: Dimensions.width100 * 1.75,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(
//                     Dimensions.circular15),
//                 color: Theme
//                     .of(context).focusColor,
//               ),
//               child: Padding(
//                 padding: EdgeInsets.only(top: Dimensions.height10,
//                     left: Dimensions.width10 / 1.25,
//                     bottom: Dimensions.height10,
//                     right: Dimensions.width10 / 1.25),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     AppIcons(
//                         icon: Icons.remove_circle_outline_rounded,
//                         backgroundColor: const Color(0xFFA8A3C1)
//                             .withOpacity(1.0)),
//
//                     Text(_counter.toString(),
//                       textAlign: TextAlign.center,
//                       style: GoogleFonts.ubuntu(
//                         color: Theme
//                             .of(context)
//                             .colorScheme
//                             .secondary,
//                         fontSize: Dimensions.fontSize20,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         _counter;
//                         print('$_counter  The counter is working');
//                       },
//                       child: AppIcons(
//                           icon: Icons.add_circle_outline_rounded,
//                           backgroundColor: const Color(0xFFA8A3C1)
//                               .withOpacity(1.0)),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//
//             Container(
//               width: Dimensions.width100,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(
//                     Dimensions.circular15),
//                 color: Theme
//                     .of(context)
//                     .colorScheme
//                     .primary,
//               ),
//               child: Padding(
//                 padding: EdgeInsets.only(top: Dimensions.height10 / 1.25,
//                     bottom: Dimensions.height10 / 1.25),
//                 child: Text('BUY NOW',
//                   textAlign: TextAlign.center,
//                   style: GoogleFonts.ubuntu(
//                     color: Theme
//                         .of(context)
//                         .colorScheme
//                         .onPrimary,
//                     fontSize: Dimensions.fontSize20,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
// }