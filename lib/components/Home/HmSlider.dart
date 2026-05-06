import 'package:flutter/material.dart';

class Hmslider extends StatefulWidget {
  const Hmslider({super.key});

  @override
  State<Hmslider> createState() => _HmsliderState();
}

class _HmsliderState extends State<Hmslider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text(
        'Hmslider',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
