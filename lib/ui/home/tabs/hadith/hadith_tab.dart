import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islamy_app/ui/home/tabs/hadith/hadith_details.dart';

class HadithTab extends StatelessWidget {
  const HadithTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    return CarouselSlider(
      options: CarouselOptions(height: height*0.66,
      enlargeCenterPage: true,
      ),
      items: List.generate(50, ( index)=>index+1,).map((index) {
        return HadithDetails(index:index, );
      }).toList(),
    );
  }
}
