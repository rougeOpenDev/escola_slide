import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class NovaVistoria extends StatefulWidget {
  
  @override
  _NovaVistoriaState createState() => new _NovaVistoriaState();
}

class _NovaVistoriaState extends State<NovaVistoria> {

  List<int> list = [1,2,3,4,5];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CarouselSlider(
          options: CarouselOptions(),
          items: list.map((item) => Container(
            child: Center(
              child: Text(item.toString())
            ),
            color: Colors.green,
          )).toList(),
        )
      ),
    );
  }
}