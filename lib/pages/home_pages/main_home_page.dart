import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop/pages/home_pages/test_page.dart';
import 'package:shop/utilities/dimensions.dart';

import 'package:supabase_flutter/supabase_flutter.dart';
//import 'package:supabase_client/supabase_client.dart';


class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {

  // final _future = Supabase.instance.client
  //     .from('countries')
  //     .select('name')
  //     .select<List<Map<dynamic, dynamic>>>();
  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (context) => TestCubit(TestPageRepo(apiClient: ApiClient()))..getData(),
      return Scaffold(

        // body: FutureBuilder<List<Map<dynamic, dynamic>>>(
        //   future: _future,
        //   builder: (context, snapshot) {
        //     if (!snapshot.hasData) {
        //       return const Center(child: CircularProgressIndicator());
        //     }
        //     final countries = snapshot.data!;
        //    return ListView.builder(
        //      itemCount: countries.length,
        //      itemBuilder: ((context, index)
        //     {
        //       final country = countries[index];
        //       return
              body: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
                    padding: EdgeInsets.only(left: Dimensions.width15, right: Dimensions.width15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: SizedBox(
                            width: Dimensions.width45,
                            height: Dimensions.height45,
                            //color: Colors.deepPurple,
                            child: const Center(
                                child: Icon(
                                    Icons.search, color: Colors.deepPurple)),
                          ),
                        ),
                        Column(
                          children: [
                            Text('Sudan', style: GoogleFonts.ubuntu(
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.fontSize20,
                              color: Colors.deepPurple,
                            ),
                            ),
                            Row(
                              children: [
                                Text('Khartoum', style: GoogleFonts.ubuntu(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.fontSize12,
                                  color: Colors.deepPurple,
                                ),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.deepPurple,
                                  size: Dimensions.height20,)
                              ],
                            ),
                            //const BigText(text: 'BigTextWidget', size: 20, overflow: TextOverflow.fade,)
                          ],
                        )
                      ],
                    ),
                  ),
                  const Expanded(child: SingleChildScrollView(
                    child: TestPage(),
                  ))
                ],
              ),
    );
          }
    //      ));
    //     }
    //   ),
    // );
  }
