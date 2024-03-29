import 'package:flutter/material.dart';

import '../utilities/dimensions.dart';
class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({super.key,
    required this.text
  });

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight/5.63;


  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
    @override
    Widget build(BuildContext context) {
      return Container(
        child: secondHalf.isEmpty? Text (firstHalf) : Column(
          children: [
            Text(hiddenText?  (firstHalf+ "...") : (firstHalf + secondHalf)),
            InkWell(
              onTap: () {

              },
              child: const Row(
                children: [
                  Text('Show more'),
                  Icon(Icons.arrow_drop_down_rounded),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Container(
      child: secondHalf.isEmpty? Text (firstHalf) : Column(
        children: [
          Text(hiddenText?  (firstHalf+ "...") : (firstHalf + secondHalf)),
          InkWell(
            onTap: () {

            },
            child: const Row(
              children: [
                Text('Show more'),
                Icon(Icons.arrow_drop_down_rounded),
              ],
            ),
          ),
        ],
      ),
    );


  }
}