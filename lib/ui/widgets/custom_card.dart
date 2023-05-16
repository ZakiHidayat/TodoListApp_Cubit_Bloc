import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final List<Widget> children;

  const CustomCard({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 6),
      decoration: BoxDecoration(

        // borderRadius: BorderRadius.vertical(
        //     top: Radius.circular(30.0)
        // ),

        border: Border.all(
            width: 1.0
        ),
        borderRadius: BorderRadius.all(
            Radius.circular(25.0)
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
