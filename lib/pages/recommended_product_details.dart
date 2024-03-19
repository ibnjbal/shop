import 'package:flutter/material.dart';
class RecommendedProductDetails extends StatelessWidget {
  const RecommendedProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
         SliverAppBar(
           expandedHeight: 300,
           flexibleSpace: FlexibleSpaceBar(
             background: Image.asset(
                 'assets/images/rose.jpg',
                  width: double.maxFinite,
                  fit: BoxFit.cover,
             ),
           )
         ),
        ],
      ),
    );
  }
}
