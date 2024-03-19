import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'package:shop/utilities/app_colors.dart';
import 'package:shop/utilities/dimensions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../popular_products_details.dart';

class TestPage extends StatefulWidget {

  const TestPage({
    super.key,
  });

  @override
  State<TestPage> createState() => _TestPage();
}

class _TestPage extends State<TestPage> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.9;
  final _height = Dimensions.testPageDefaultImageHeight.toInt();

  final _future = Supabase.instance.client
      .from('countries')
      // .select('name')
      .select();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        //print('Current Page value = '+ _currPageValue.toString());
      });
    });
  }

// dispose method is to clean the Cache from unwanted data
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  Future<void> _refresh()async {
    return Future.delayed(
      const Duration(milliseconds: 1000),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFFFbF6FF),
        // appBar: AppBar(
        //   systemOverlayStyle: SystemUiOverlayStyle.dark,
        // ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height20),
              padding: EdgeInsets.only(
                  left: Dimensions.width15, right: Dimensions.width15, top: Dimensions.height10),
              decoration: const BoxDecoration(
                boxShadow: [
                  // BoxShadow(
                  //   color: Colors.grey,
                  //   spreadRadius: Dimensions.height10/4,
                  //   blurRadius: Dimensions.height10/5,
                  //   blurStyle: BlurStyle.normal,
                  //   offset: const Offset(0, 0),
                  // ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Center(
                  //   child: SizedBox(
                  //     width: Dimensions.width45,
                  //     height: Dimensions.height45,
                  //     child: const Center(
                  //         child: Icon(
                  //             Icons.search, color: AppColors.textColor1)),
                  //   ),
                  // ),
                  Container(
                    padding: EdgeInsets.symmetric(
                   //   horizontal: Dimensions.width10,
                      vertical: Dimensions.height10,
                    ),
                    height: Dimensions.height60,
                    width: Dimensions.searchTextFieldWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(Dimensions.circular30)),
                    ),
                    child: TextField(
                      autocorrect: true,
                      cursorColor: Colors.black54,
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(Dimensions.circular30)),
                          borderSide: BorderSide(
                            color: const Color(0xFFECE6F0),
                            width: Dimensions.width10/8,
                          ),
                        ),
                        filled: true,
                        fillColor: const Color(0xFFECE6F0),
                        contentPadding: EdgeInsets.only(top: Dimensions.height10/2),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(Dimensions.circular30)),
                          borderSide: BorderSide(
                            color: const Color(0xFFECE6F0),
                            width: Dimensions.width10/8,
                          ),
                        ),
                        focusColor: const Color(0xFFECE6F0),
                        hoverColor: const Color(0xFFECE6F0),
                        prefixIcon: GestureDetector(
                            onTap: () {},
                            child: const Icon(Icons.search_rounded)),
                        prefixIconColor: Theme.of(context).colorScheme.secondary,
                        hintText: 'What are you looking for?',
                        hintStyle: GoogleFonts.ubuntu(
                          fontSize: Dimensions.fontSize12+4,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(Dimensions.circular30)),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.secondary,
                            width: Dimensions.width10/8,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width10,
                      vertical: Dimensions.height10,
                    ),
                    width: Dimensions.width100 - Dimensions.width15,
                    height: Dimensions.height60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: AutoSizeText(
                              'Saudi Arabia',
                              softWrap: true,
                              overflow: TextOverflow.fade,
                              style: GoogleFonts.ubuntu(
                                fontWeight: FontWeight.w500,
                                fontSize: Dimensions.fontSize18,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: AutoSizeText(
                                'Meccah, Southern Aziziyah',
                                softWrap: true,
                                overflow: TextOverflow.fade,
                                maxLines: 1,
                                style: GoogleFonts.ubuntu(
                                  fontWeight: FontWeight.w500,
                                  fontSize: Dimensions.fontSize12,
                                  color: Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: AppColors.textColor1,
                              size: Dimensions.height20,
                            )
                          ],
                        ),
                        //const BigText(text: 'BigTextWidget', size: 20, overflow: TextOverflow.fade,)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: RefreshIndicator(
                onRefresh: _refresh,
                color: Theme.of(context).colorScheme.primary,
                displacement: 0,
                child: SingleChildScrollView(
                  child: FutureBuilder<List<Map<String, dynamic>>>(
                      future: _future,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator(
                            color: Theme.of(context).colorScheme.primary,
                          ));
                        }
                        final countries = snapshot.data!;
                        print(countries.length);
                        print(countries.length);
                        print(countries.length);
                        print(countries.length);

                        //  final countriesList = countries.toList();
                        // var pro = countriesList[abc];
                        // print("The Countries List has built" +countriesList.toString());



                        return Column(
                          children: [
                          Container(
                            margin: const EdgeInsets.all(0),
                            padding: const EdgeInsets.all(0),
                            decoration: BoxDecoration(
                              // image: const DecorationImage(
                              //   image: AssetImage('assets/images/white4.jpg'),
                              // ),
                              borderRadius:
                                  BorderRadius.circular(Dimensions.circular25),
                              color: Colors.transparent,
                            ),
                            height: Dimensions.pageViewBackgroundContainer / 1.85,
                            child: PageView.builder(
                                controller: pageController,
                                itemCount: countries.length,
                                itemBuilder: (context, position) {
                                  return buildPageItem(position);
                                }),
                          ),








                          //// Dots Indicator Areas

                          // DotsIndicator(
                          //   // dotsCount: countries.isEmpty?1:countries.length,
                          //   dotsCount: countries.length,
                          //   position: _currPageValue.toInt(),
                          //   decorator: DotsDecorator(
                          //     activeColor: const Color(0xFF747384),
                          //     color: const Color(0xFFA8A3C1),
                          //     size: const Size.square(9.0),
                          //     activeSize: const Size(18.0, 9.0),
                          //     activeShape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(5.0)),
                       //     ),
                       //   ),
                          // SmoothPageIndicator(
                          //   controller: pageController,
                          //   count: countries.length,
                          //   effect: SwapEffect(
                          //     activeDotColor: AppColors.mainColor1,
                          //     dotColor: AppColors.mainColor2,
                          //     dotHeight: Dimensions.height10/1.25,
                          //     dotWidth: Dimensions.height10/1.25,
                          //   ),
                          // ),
                          // SizedBox(height: Dimensions.height10/2),





                         /// OCCASION . SALE TEXT

                            Container(
                            height: Dimensions.height30,
                            color: Colors.transparent,
                            margin: EdgeInsets.only(left: Dimensions.width20),
                            child: Row(
                                children: [
                              Text(
                                'OCCASION, Summer Sale',
                                style: GoogleFonts.kanit(
                                  fontWeight: FontWeight.normal,
                                  fontSize: Dimensions.fontSize20,
                                  color: Colors.black,

                                ),
                              ),
                              SizedBox(width: Dimensions.width10),
                              // Container(
                              //   margin: EdgeInsets.only(
                              //       bottom: Dimensions.height10 + 2),
                              //   child: Text(
                              //     '.',
                              //     style: TextStyle(
                              //       fontWeight: FontWeight.bold,
                              //       fontSize: Dimensions.fontSize30+Dimensions.fontSize10,
                              //     ),
                              //   ),
                              // ),
                              SizedBox(width: Dimensions.width10),


                              //     Container(
                              //   margin: EdgeInsets.only(top: Dimensions.height10/2.5),
                              //   child: Text(
                              //     'SALE',
                              //     style: GoogleFonts.ubuntu(
                              //       fontWeight: FontWeight.normal,
                              //       color: const Color(0xFFA8A3C1),
                              //     ),
                              //   ),
                              // ),
                            ]),
                          ),






                           /////// OCCASION SALE Body Widget

                              Container(
                                color: Colors.transparent,
                                height: Dimensions.height240 + Dimensions.height50,
                                child: FutureBuilder<List<Map<String,dynamic>>>(
                              future: _future,
                              builder: (context, snapshot){
                                if (!snapshot.hasData){
                                  return const Center();
                                }
                                final countriesList = snapshot.data;
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                    itemCount: countries.length,
                                  itemBuilder: (context, index){
                                    final country = countriesList ?[index];
                                    return


                                        Stack(
                                          children: [

                                            Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                              margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                                              height: Dimensions.height240 + Dimensions.height50,
                                              width: Dimensions.width130+Dimensions.width10,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(Dimensions.circular10 + Dimensions.height10/2.5),
                                                color: const Color(0xffF7F2FA), //AppColors.searchFieldFill,
                                              ),
                                              child: Column(
                                                //      crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [


                                                Stack(
                                                  children: [
                                                    Align(
                                                      alignment: Alignment.center,
                                                      child: Container(
                                                      //margin: EdgeInsets.only(top: Dimensions.height10/1.5),
                                                        //      padding: EdgeInsets.only(left: Dimensions.width10),
                                                      height: Dimensions.height120 + Dimensions.height40,
                                                      width: Dimensions.width130 + Dimensions.width10,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.only(
                                                          topLeft: Radius.circular(Dimensions.circular10),
                                                          topRight: Radius.circular(Dimensions.circular10),
                                                        ),
                                                        image: DecorationImage(
                                                          image: NetworkImage(country?['image']),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                     ),
                                                    ),

                                                    country?['hot items'] == false ? Container() : Align(
                                                      alignment: Alignment.topRight,
                                                      child: Container(
                                                        alignment: Alignment.center,
                                                        height: Dimensions.height15,
                                                        width: MediaQuery.of(context).size.width < 400? Dimensions.width70 : Dimensions.width70 + Dimensions.width20,
                                                        decoration: BoxDecoration(
                                                          color: Theme.of(context).colorScheme.primaryContainer,
                                                          borderRadius: BorderRadius.only(
                                                            bottomLeft: Radius.circular(Dimensions.circular10),
                                                            topRight: Radius.circular(Dimensions.circular10),
                                                          ),
                                                        ),
                                                        child: AutoSizeText(
                                                          country?['hot item text'],
                                                          overflow: TextOverflow.ellipsis,
                                                          maxLines: 1,
                                                          style: GoogleFonts.ubuntu(
                                                            color: Theme.of(context).colorScheme.primary,
                                                            fontWeight: FontWeight.w500,
                                                            fontSize:  Dimensions.fontSize14/2,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ]
                                                ),




                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(left: Dimensions.width10),
                                                    child: RichText(
                                                      text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: country?['price'].toString(),
                                                          style: GoogleFonts.ubuntu(
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: Dimensions.fontSize24,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: '.${country?['piastres'].toString()}',
                                                          style: GoogleFonts.ubuntu(
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: Dimensions.fontSize12,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: '   EGP',
                                                          style: GoogleFonts.ubuntu(
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: Dimensions.fontSize12,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                       ]
                                                      ),
                                                    ),
                                                  ),


                                                  Padding(
                                                    padding: EdgeInsets.only(left:  Dimensions.width10),
                                                    child: AutoSizeText(
                                                      country?['name'],
                                                      softWrap: false,
                                                      maxLines: 1,
                                                      overflow: TextOverflow.fade,
                                                      style: GoogleFonts.ubuntu(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: Dimensions.fontSize16,
                                                        color: Theme.of(context).colorScheme.secondary,
                                                      ),
                                                    ),
                                                  ),

                                                  country?['hot items'] == false ? Container() : Padding(
                                                  padding: EdgeInsets.only(left: Dimensions.width10/2),
                                                  child: Row(
                                                    children: [
                                                      AutoSizeText(
                                                          country!['price before'].toString(),
                                                          maxLines: 1,
                                                          overflow: TextOverflow.fade,
                                                          style: GoogleFonts.kanit(
                                                            color: Theme.of(context).colorScheme.secondary,
                                                            decoration: TextDecoration.lineThrough,
                                                          ),
                                                      ),

                                                      country['hot items'] == false ? Container() :  AutoSizeText(
                                                        ' ${(((country['price before'] / country['price']) - 1) * 100 ).toStringAsFixed(0)}% Discount',
                                                          overflow: TextOverflow.fade,
                                                          maxLines: 1,
                                                          style: GoogleFonts.kanit(
                                                            color: Colors.deepPurple,
                                                            fontWeight: FontWeight.w400,
                                                          ),
                                                      ),
                                                    ],
                                                  ),
                                                ),


                                                // Padding(
                                                //   padding: EdgeInsets.only(left: Dimensions.width10),
                                                //   child: Expanded(
                                                //     child: AutoSizeText(
                                                //         country['id'].toString(),
                                                //         textAlign: TextAlign.start,
                                                //         overflow: TextOverflow.fade,
                                                //         style: GoogleFonts.ubuntu(
                                                //           fontWeight: FontWeight.w500,
                                                //           fontSize: Dimensions.fontSize16,
                                                //           color: AppColors.textColor1,
                                                //         ),
                                                //     ),
                                                //   ),
                                                // ),


                                                  Padding(
                                                    padding: EdgeInsets.only(left: Dimensions.width10),
                                                    child: Text(
                                                      country!['package'].toString(),
                                                      style: GoogleFonts.kanit(
                                                        fontSize: Dimensions.fontSize14,
                                                        color: Theme.of(context).colorScheme.secondary,
                                                        fontWeight: FontWeight.w300,
                                                      ),
                                                    ),
                                                  ),


                                                  country['hot items'] == false ? Padding(
                                                  padding: EdgeInsets.only(left: Dimensions.width10),
                                                  child: SizedBox(
                                                    width: Dimensions.width120 + Dimensions.width10/2,
                                                    child: DefaultTextStyle(
                                                          style: GoogleFonts.ubuntu(
                                                          color: Theme.of(context).colorScheme.error,
                                                            fontSize: Dimensions.fontSize12 + 1,
                                                            fontWeight: FontWeight.w400,
                                                          ),
                                                      child: AnimatedTextKit(
                                                        animatedTexts: [
                                                          TypewriterAnimatedText(
                                                              country['description'],
                                                                textAlign: TextAlign.start,
                                                              speed: const Duration(milliseconds: 300),
                                                              cursor: '|',
                                                              textStyle: GoogleFonts.ubuntu(
                                                                color: Theme.of(context).colorScheme.error,
                                                                fontSize: Dimensions.fontSize12 + 1,
                                                                fontWeight: FontWeight.w400,
                                                              ),
                                                          ),
                                                          TypewriterAnimatedText(
                                                            country['hot item text'] == null ? '' : country['hot item text'].toString(),
                                                              textAlign: TextAlign.start,
                                                              speed: const Duration(milliseconds: 300),
                                                            cursor: '|',
                                                          ),
                                                          TypewriterAnimatedText(
                                                              country['name'],
                                                            textAlign: TextAlign.start,
                                                            speed: const Duration(milliseconds: 300),
                                                            cursor: '|',
                                                          ),
                                                          ],
                                                        pause: const Duration(microseconds: 500),
                                                        isRepeatingAnimation: true,
                                                        repeatForever: true,
                                                      ),
                                                    ),
                                                  ),
                                                ) : Container(),


                                                  const Text(''),

                                                  country['stock'] < 5 ? Padding(
                                                    padding: EdgeInsets.only(left: Dimensions.width10),
                                                    child: country['stock'] == 0 ?  Text('Out of Stock',
                                                      textAlign: TextAlign.start,
                                                      style: GoogleFonts.ubuntu(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: Dimensions.fontSize14,
                                                        decoration: TextDecoration.lineThrough,
                                                        color: Theme.of(context).colorScheme.secondary,
                                                      ),
                                                    ) : Text ('only ${country['stock'].toString()} left',
                                                      style: GoogleFonts.ubuntu(
                                                        fontSize: Dimensions.fontSize14,
                                                        color: Colors.red,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                  ) : Container(),
                                              ],
                                                ),
                                              ]
                                              )
                                              ),
                                            ),


                                            Positioned(
                                              top: Dimensions.height120 + Dimensions.height10,
                                              right: - (Dimensions.width15 - Dimensions.width10/5),
                                              child: Transform.scale(
                                                scale: 0.5,
                                                child: FloatingActionButton(
                                                  heroTag: null,
                                                  onPressed: (){},
                                                  elevation: 1,
                                                  child: Icon(
                                                      Icons.add,
                                                  size: Dimensions.height40,
                                                  ),

                                                ),
                                              ),
                                            ),
                                          ]
                                      );
                                  },
                                );
                              }
                              ),
                              ),


                            ///////  Sponsored ADVERTISING AREA

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: Dimensions.height20, left: Dimensions.width15),
                                  child: Text(
                                    'Sponsored Products, by companies',
                                    style: GoogleFonts.kanit(
                                      fontSize: Dimensions.fontSize20,
                                      color: Colors.black,
                                      height: Dimensions.height10/(2 * Dimensions.height10),
                                      letterSpacing: 0,
                                    ),
                                  ),
                                ),
                                Container(
                                //  padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
                                  margin: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height10, left: Dimensions.width10, right: Dimensions.width10),
                                  height: Dimensions.height100 * 4,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(Dimensions.circular15),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(Dimensions.circular15),
                                      image: const DecorationImage(
                                          image: NetworkImage('https://pxtnkrysopeyonsgbybh.supabase.co/storage/v1/object/sign/avatars/pexels-tien-nguyen-18533666.jpg?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJhdmF0YXJzL3BleGVscy10aWVuLW5ndXllbi0xODUzMzY2Ni5qcGciLCJpYXQiOjE3MDkzODY3NDIsImV4cCI6MTc0MDkyMjc0Mn0.xCjq43kxjm5cKpPZVHfXpvDazraMZxeY2SDNIq6tm6Y&t=2024-03-02T13%3A39%3A06.724Z'),
                                        fit: BoxFit.cover
                                      ),
                                    ),
                                  ),

                                ),
                              ],
                            ),










                            ///// RECOMMENDED!

                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(left: Dimensions.width15),
                              child: Text(
                                'Recommended by Our team',
                                style: GoogleFonts.kanit(
                                  fontSize: Dimensions.fontSize20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ),

                            Container(
                              //  padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
                              margin: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height10, left: Dimensions.width10, right: Dimensions.width10),
                              height: Dimensions.height100 * 1.5,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(Dimensions.circular15),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Dimensions.circular15),
                                  image: const DecorationImage(
                                      image: NetworkImage('https://pxtnkrysopeyonsgbybh.supabase.co/storage/v1/object/sign/images/pexels-pixabay-33783.jpg?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpbWFnZXMvcGV4ZWxzLXBpeGFiYXktMzM3ODMuanBnIiwiaWF0IjoxNzA5ODAyMzI0LCJleHAiOjE3NDEzMzgzMjR9.dPNCVRQ0Uz4nUM4sBoSsVFJ2Go6KplaneNlll-s_f4A&t=2024-03-07T09%3A05%3A24.986Z'),
                                      fit: BoxFit.cover
                                  ),
                                ),
                              ),

                            ),


                            Container(

                              padding: EdgeInsets.only(top: Dimensions.height10),
                              color: Colors.transparent,
                              height: Dimensions.height120 * 3.5,
                              child: FutureBuilder<List<Map<String,dynamic>>>(
                                  future: _future,
                                  builder: (context, snapshot){
                                    if (!snapshot.hasData){
                                      return const Center();
                                    }
                                    final countriesList = snapshot.data;
                                    return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: countries.length,
                                      itemBuilder: (context, index){
                                        final country = countriesList ?[index];
                                        return country?['hot items'] == false ? Container() : Stack(
                                              children: [

                                                // Positioned(
                                                //   bottom: 0,
                                                //   left: 0,
                                                //   child: Container(
                                                //     height: Dimensions.height25,
                                                //     width: Dimensions.width100,
                                                //     color: Colors.red,
                                                //   ),
                                                // ),


                                                Container(
                                                  margin: EdgeInsets.only(left: Dimensions.width20, top: Dimensions.height10/2),
                                                  padding: EdgeInsets.only(left: Dimensions.width20),
                                                  height: Dimensions.height120 * 3.5,
                                                  width: Dimensions.width120 *2,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(Dimensions.circular5),
                                                    image: DecorationImage(
                                                      alignment: Alignment.center,
                                                      colorFilter: const ColorFilter.mode(
                                                          Colors.black26,
                                                          BlendMode.darken,
                                                      ),
                                                      opacity: 1.0,
                                                      image: NetworkImage(country?['image']),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),



                                                Positioned(
                                                  left:Dimensions.width30,
                                                  bottom:Dimensions.height30,
                                                  child: AutoSizeText(
                                                    country?['hot items'] == false? '' : country?['hot item text'],
                                                      overflow: TextOverflow.fade,
                                                      softWrap: true,
                                                      style: GoogleFonts.kanit(
                                                      color: Colors.white,
                                                      fontSize: Dimensions.fontSize16,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                ),

                                                // Positioned(
                                                //   left:Dimensions.width20,
                                                //   top:Dimensions.height10,
                                                //   child: Text(
                                                //     'Recommended',
                                                //     overflow: TextOverflow.fade,
                                                //     softWrap: true,
                                                //     style: GoogleFonts.ubuntu(
                                                //       color: Colors.white,
                                                //       fontSize: Dimensions.fontSize20,
                                                //       fontWeight: FontWeight.w500,
                                                //     ),
                                                //   ),
                                                // ),


                                                // country?['hot items'] == false ? Container() : Positioned(
                                                //   top: 0,
                                                //   right: Dimensions.width10-4,
                                                //   child: Container(
                                                //     height: Dimensions.height25,
                                                //     width: Dimensions.width80,
                                                //     decoration: BoxDecoration(
                                                //       color: Colors.red,
                                                //       borderRadius: BorderRadius.only(
                                                //         bottomLeft: Radius.circular(Dimensions.circular10  + Dimensions.height10/2.5),
                                                //         topRight: Radius.circular(Dimensions.circular10 + Dimensions.height10/2.5),
                                                //       ),
                                                //     ),
                                                //     child: Center(
                                                //       child: Text(
                                                //         'HOT ITEM',
                                                //         overflow: TextOverflow.ellipsis,
                                                //         style: GoogleFonts.ubuntu(
                                                //           color: Colors.white,
                                                //           fontWeight: FontWeight.w500,
                                                //           fontSize: MediaQuery.of(context).size.width<400? Dimensions.fontSize12+3 : Dimensions.fontSize18,
                                                //         ),
                                                //       ),
                                                //     ),
                                                //   ),
                                                // ),
                                              ]
                                          );
                                      },
                                    );
                                  }
                              ),
                            ),





                            ///////////////////// Shadows

                            // Container(
                            //   height: Dimensions.height75,
                            //   width: Dimensions.width120, // + Dimensions.width20,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(Dimensions.circular10),
                            //     color: Colors.white,
                            //     boxShadow: List.filled(
                            //       1,
                            //       BoxShadow(
                            //         color: Colors.black26,
                            //         blurRadius: Dimensions.height10/100,
                            //         offset: const Offset(0, 0.5),
                            //         blurStyle: BlurStyle.normal,
                            //         spreadRadius: 0.1,
                            //       ),
                            //
                            //     ),
                            //     image: const DecorationImage (
                            //       image: NetworkImage('https://pxtnkrysopeyonsgbybh.supabase.co/storage/v1/object/sign/avatars/may-2022.gif?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJhdmF0YXJzL21heS0yMDIyLmdpZiIsImlhdCI6MTcwOTYzMjMyNCwiZXhwIjoxNzQxMTY4MzI0fQ.FZnlyuPERfSiypd1kyQZHb8lxZwJkAvEEwYXkNtAEus&t=2024-03-05T09%3A52%3A05.223Z'),
                            //       fit: BoxFit.cover,
                            //     ),
                            //   ),
                            // ),




                            ////////// NEW!

                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(left: Dimensions.width20, top: Dimensions.height10),
                              child: Text(
                                'What would you like to order?',
                                style: GoogleFonts.kanit(
                                  color: Colors.black,
                                  fontSize: Dimensions.fontSize20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),


                            Container(
                              //  padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
                              margin: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height10, left: Dimensions.width10, right: Dimensions.width10),
                              height: Dimensions.height100 * 1.5,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(Dimensions.circular15),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Dimensions.circular15),
                                  image: const DecorationImage(
                                      image: NetworkImage('https://pxtnkrysopeyonsgbybh.supabase.co/storage/v1/object/sign/images/pexels-engin-akyurt-2271104.jpg?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpbWFnZXMvcGV4ZWxzLWVuZ2luLWFreXVydC0yMjcxMTA0LmpwZyIsImlhdCI6MTcwOTgwMjAxMiwiZXhwIjoxNzQxMzM4MDEyfQ.2Py435YSN_POtHdQ8jPkGuYkl9eEMGvrjCulfxI33m0&t=2024-03-07T09%3A00%3A12.655Z'),
                                      fit: BoxFit.cover
                                  ),
                                ),
                              ),

                            ),

                            // Container(
                            //   //  padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
                            //   margin: EdgeInsets.only(top: Dimensions.height10, bottom: Dimensions.height10, left: Dimensions.width10, right: Dimensions.width10),
                            //   height: Dimensions.height100 * 4,
                            //   decoration: const BoxDecoration(
                            //     color: Colors.red,
                            //    // borderRadius: BorderRadius.circular(Dimensions.circular15),
                            //   ),
                            //   child: Column(
                            //     children: [
                            //       Row(
                            //         children: [
                            //           Container(
                            //             padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10, bottom: Dimensions.height10),
                            //             margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10,  bottom: Dimensions.height10),
                            //             child: Column(
                            //               children: [
                            //                 Stack(
                            //                   alignment: Alignment.center,
                            //                   children: [
                            //                     Container(
                            //                       height: Dimensions.height120,
                            //                       width: Dimensions.width75, // + Dimensions.width20,
                            //                       decoration: BoxDecoration(
                            //                         borderRadius: BorderRadius.circular(Dimensions.circular10),
                            //                         color: Colors.white,
                            //                         image: const DecorationImage (
                            //                            image: NetworkImage('https://pxtnkrysopeyonsgbybh.supabase.co/storage/v1/object/sign/avatars/may-2022.gif?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJhdmF0YXJzL21heS0yMDIyLmdpZiIsImlhdCI6MTcwOTYzMjMyNCwiZXhwIjoxNzQxMTY4MzI0fQ.FZnlyuPERfSiypd1kyQZHb8lxZwJkAvEEwYXkNtAEus&t=2024-03-05T09%3A52%3A05.223Z'),
                            //                         fit: BoxFit.cover,
                            //                         ),
                            //                       ),
                            //                     ),
                            //                   ],
                            //                 ),
                            //                 const Text('Grocery'),
                            //               ],
                            //             ),
                            //           ),
                            //
                            //           Row(
                            //             children: [
                            //               Container(
                            //                 padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10, bottom: Dimensions.height10),
                            //                 margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10,  bottom: Dimensions.height10),
                            //                 child: Column(
                            //                   children: [
                            //                     Stack(
                            //                       alignment: Alignment.center,
                            //                       children: [
                            //                         Container(
                            //                           height: Dimensions.height75,
                            //                           width: Dimensions.width120, // + Dimensions.width20,
                            //                           decoration: BoxDecoration(
                            //                             borderRadius: BorderRadius.circular(Dimensions.circular10),
                            //                             color: Colors.white,
                            //                             boxShadow: List.filled(
                            //                               1,
                            //                               BoxShadow(
                            //                                 color: Colors.black26,
                            //                                 blurRadius: Dimensions.height10/100,
                            //                                 offset: const Offset(0, 0.5),
                            //                                 blurStyle: BlurStyle.normal,
                            //                                 spreadRadius: 0.1,
                            //                               ),
                            //
                            //                             ),
                            //                             image: const DecorationImage (
                            //                               image: NetworkImage('https://pxtnkrysopeyonsgbybh.supabase.co/storage/v1/object/sign/avatars/321.jpg?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJhdmF0YXJzLzMyMS5qcGciLCJpYXQiOjE3MDk1ODcyMTIsImV4cCI6MTc0MTEyMzIxMn0.qXB1mKwpjFR43mAunbxNixg_Xmkt7bikpWh9vKqmlBU&t=2024-03-04T21%3A20%3A14.418Z'),
                            //                               fit: BoxFit.cover,
                            //                             ),
                            //                           ),
                            //                         ),
                            //                       ],
                            //                     ),
                            //                     const Text('Grocery'),
                            //                   ],
                            //                 ),
                            //               ),
                            //             ],
                            //           ),
                            //
                            //         ],
                            //       ),
                            //       Row(
                            //         children: [
                            //           Container(
                            //             child: Row(
                            //               children: [
                            //                 Container(
                            //                   padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10, bottom: Dimensions.height10),
                            //                   margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10,  bottom: Dimensions.height10),
                            //                   child: Column(
                            //                     children: [
                            //                       Stack(
                            //                         alignment: Alignment.center,
                            //                         children: [
                            //                           Container(
                            //                             height: Dimensions.height75,
                            //                             width: Dimensions.width120, // + Dimensions.width20,
                            //                             decoration: BoxDecoration(
                            //                               borderRadius: BorderRadius.circular(Dimensions.circular10),
                            //                               color: Colors.white,
                            //                               boxShadow: List.filled(
                            //                                 1,
                            //                                 BoxShadow(
                            //                                   color: Colors.black26,
                            //                                   blurRadius: Dimensions.height10/100,
                            //                                   offset: const Offset(0, 0.5),
                            //                                   blurStyle: BlurStyle.normal,
                            //                                   spreadRadius: 0.1,
                            //                                 ),
                            //
                            //                               ),
                            //                               image: const DecorationImage (
                            //                                 image: NetworkImage('https://pxtnkrysopeyonsgbybh.supabase.co/storage/v1/object/sign/avatars/321.jpg?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJhdmF0YXJzLzMyMS5qcGciLCJpYXQiOjE3MDk1ODcyMTIsImV4cCI6MTc0MTEyMzIxMn0.qXB1mKwpjFR43mAunbxNixg_Xmkt7bikpWh9vKqmlBU&t=2024-03-04T21%3A20%3A14.418Z'),
                            //                                 fit: BoxFit.cover,
                            //                               ),
                            //                             ),
                            //                           ),
                            //                         ],
                            //                       ),
                            //                       const Text('Grocery'),
                            //                     ],
                            //                   ),
                            //                 ),
                            //               ],
                            //             ),
                            //           ),
                            //           Container(
                            //             child: Row(
                            //               children: [
                            //                 Container(
                            //                   padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10, bottom: Dimensions.height10),
                            //                   margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10,  bottom: Dimensions.height10),
                            //                   child: Column(
                            //                     children: [
                            //                       Stack(
                            //                         alignment: Alignment.center,
                            //                         children: [
                            //                           Container(
                            //                             height: Dimensions.height75,
                            //                             width: Dimensions.width120, // + Dimensions.width20,
                            //                             decoration: BoxDecoration(
                            //                               borderRadius: BorderRadius.circular(Dimensions.circular10),
                            //                               color: Colors.white,
                            //                               boxShadow: List.filled(
                            //                                 1,
                            //                                 BoxShadow(
                            //                                   color: Colors.black26,
                            //                                   blurRadius: Dimensions.height10/100,
                            //                                   offset: const Offset(0, 0.5),
                            //                                   blurStyle: BlurStyle.normal,
                            //                                   spreadRadius: 0.1,
                            //                                 ),
                            //
                            //                               ),
                            //                               image: const DecorationImage (
                            //                                 image: NetworkImage('https://pxtnkrysopeyonsgbybh.supabase.co/storage/v1/object/sign/avatars/pexels-diogo-cacito-6816312.jpg?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJhdmF0YXJzL3BleGVscy1kaW9nby1jYWNpdG8tNjgxNjMxMi5qcGciLCJpYXQiOjE3MDk1ODIyNTUsImV4cCI6MTc0MTExODI1NX0.h8mXcU9kuZEQAdQvEaMOyEWAnBKuaz4ccvseO8e6J4c&t=2024-03-04T19%3A57%3A36.580Z'),
                            //                                 fit: BoxFit.cover,
                            //                               ),
                            //                             ),
                            //                           ),
                            //                         ],
                            //                       ),
                            //                       const Text('Grocery'),
                            //                     ],
                            //                   ),
                            //                 ),
                            //               ],
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //     ],
                            //   ),
                            //
                            // ),





                            ////// BUY MORE!
                            //// needs a list of products

                            // Container(
                            //   //  padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
                            //   margin: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height10, left: Dimensions.width10, right: Dimensions.width10),
                            //   height: Dimensions.height100 * 6,
                            //   decoration: BoxDecoration(
                            //     color: Colors.red,
                            //     borderRadius: BorderRadius.circular(Dimensions.circular15),
                            //   ),
                            //   child: Stack(
                            //     alignment : Alignment.center,
                            //     children: [
                            //       Positioned(
                            //         top:0,
                            //           // left: 165,
                            //           child: Column(
                            //             children: [
                            //               Text(
                            //                 'BUY MORE',
                            //                   style: GoogleFonts.ubuntu(
                            //                     color: Colors.white,
                            //                     fontSize: Dimensions.fontSize20,
                            //                     fontWeight: FontWeight.w500,
                            //                   ),
                            //               ),
                            //             ],
                            //           ),
                            //       ),
                            //     ],
                            //   ),
                            //
                            // ),










                            //////// RAMADAN COLLECTION TEXT

                            Container(
                              height: Dimensions.height30,
                              color: Colors.transparent,
                              margin: EdgeInsets.only(left: Dimensions.width10),
                              child: Row(
                                  children: [
                                    Text(
                                      'Ramadan Collection unprecedented!',
                                      style: GoogleFonts.kanit(
                                        fontWeight: FontWeight.w400,
                                        fontSize: Dimensions.fontSize20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ]
                              ),
                            ),








                          /////   Vertical Scroll View

                          FutureBuilder<List<Map<String, dynamic>>>(
                            future: _future,
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return const Center(); //child: CircularProgressIndicator());
                              }
                              final countries = snapshot.data!;
                              return ListView.builder(
                                itemCount: countries.length,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: ((context, index) {
                                  final country = countries[index];
                                  return Container(
                                    color: Colors.transparent,
                                    margin: EdgeInsets.only(
                                       // top: Dimensions.height10,
                                        left: Dimensions.width20,
                                        right: Dimensions.width20,
                                        bottom: Dimensions.height10
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: Dimensions.height120,
                                          width: Dimensions.height120,
                                          margin: EdgeInsets.only(
                                              right: Dimensions.width15),
                                          // color: Colors.white38,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            image: DecorationImage(
                                                image:
                                                    NetworkImage(country['image']),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.height15),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            //margin: EdgeInsets.only(left: Dimensions.width40),
                                            height: Dimensions.height120,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(Dimensions.height10),
                                                  bottomRight: Radius.circular(Dimensions.height10)),
                                              color: Colors.transparent,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  right: Dimensions.width25),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    country['name'],
                                                    style: GoogleFonts.ubuntu(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize:
                                                          Dimensions.fontSize18,
                                                      color:
                                                          const Color(0xFF747384),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      color: Colors.transparent,
                                                      margin: EdgeInsets.only(
                                                          bottom:
                                                              Dimensions.height10),
                                                      child: AutoSizeText(
                                                        country['details'],
                                                        style: GoogleFonts.ubuntu(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color:
                                                              const Color(0xFFA8A3C1),
                                                        ),
                                                        overflow: TextOverflow.fade,
                                                        maxLines: MediaQuery.of(context).size.height > 690 ? 4 : 2,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: Dimensions.width10),
                                                    child: Row(
                                                      children: [
                                                        const Icon(
                                                            Icons.favorite_rounded,
                                                            color: Colors.red),
                                                        SizedBox(
                                                            width:
                                                                Dimensions.width10 /
                                                                    2),
                                                        Text(
                                                            country['id']
                                                                .toString(),
                                                            style: GoogleFonts.ubuntu(
                                                                color: const Color(
                                                                    0xFFA8A3C1),
                                                                fontWeight:
                                                                    FontWeight.normal),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                              );
                            },
                          )
                            ]
                        );
                      }
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }







  ///////// OUT of the Page, Just The BUILD PAGE ITEMS
  Widget buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }

    return FutureBuilder<List<Map<dynamic, dynamic>>>(
          future: _future,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(); //child: CircularProgressIndicator());
            }
            final product = _future;
            final countries = snapshot.data!;
            final country = countries[index];
      
            //
            // return ListView.builder(
            //     itemCount: country.length,
            //     itemBuilder: (context, index) {
            //
            //        final row = country[index];
      
            return Transform(
              transform: matrix,
              child: Stack(alignment: Alignment.center,
                  children: [
                Positioned(
                  /// Photos Containers
                  height: Dimensions.height120 + Dimensions.height20,
                 // left: Dimensions.width10 / 8,
                  child: GestureDetector(
                    // onTap: Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const PopularProductsDetails(),
                    //       settings: RouteSettings(arguments: country[index]),
      
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PopularProductsDetails(
                            id: countries[index]['id'],
                            name: countries[index]['name'],
                            image: countries[index]['image'],
                            description: countries[index]['description'],
                            details: countries[index]['details'],
                            price: countries[index]['price'],
                            piastres: countries[index]['piastres'],
                            hotItem: countries[index]['hot items'],
                            hotItemText: countries[index]['hot item text'],
                            priceBefore: countries[index]['price before'],
                            stock: countries[index]['stock'],
                            package: countries[index]['package'],
                            brand: countries[index]['brand'],
                            brandLogo: countries[index]['brand logo'],
                          ),
                          settings: RouteSettings(arguments: country[index]),
                        )),
      
                    // onTap: () => Navigator.of(context).pushNamed(const PopularProductsDetails(countryList: []).toString(), arguments: country[index]),
                    // Get.toNamed(RouteHelper.getPopularFood(country[index] as int));
                    child: Container(
                      height: Dimensions.testPageViewContainerHeight / 1.5,
                      width: Dimensions.testPageViewContainerWidth,
                      padding: const EdgeInsets.only(left: 0, right: 0, top: 0),
                      margin: const EdgeInsets.only(left: 0, right: 0, top: 0),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: Dimensions.height10.toDouble(),
                            offset: Offset(0, Dimensions.height10 / 2),
                          ),
                        ],
                        color: index.isEven ? const Color(0xfff7f2fa) : const Color(0xffE7E0EC),
                        borderRadius: BorderRadius.circular(Dimensions.height10),
                        image: DecorationImage(
                          image: NetworkImage(country['image']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: Dimensions.width10,
                  bottom: Dimensions.height15+2.5,
                  child: Row(
                    children: [
                      const Icon(Icons.favorite_rounded, color: Colors.red),
                      SizedBox(width: Dimensions.width10 / 2),
                      Text(country['id'].toString(),
                          style: GoogleFonts.ubuntu(
                              color: Colors.white,
                              fontWeight: FontWeight.normal)),
                    ],
                  ),
                ),
              ]),
            );
          });
  }
}