import 'package:flutter/material.dart';

class HmCategory extends StatefulWidget {
  const HmCategory({super.key});

  @override
  State<HmCategory> createState() => _HmCategoryState();
}

class _HmCategoryState extends State<HmCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 80,
            height: 100,
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text(
              '分类$index',
              style: TextStyle(color: Colors.black),
            ),
            margin: EdgeInsets.symmetric(horizontal: 10),
          );
        },
      ),
    );
  }
}