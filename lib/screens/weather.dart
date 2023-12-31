import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/models/weather_location.dart';
import 'package:weather_app/widgets/slider_dot.dart';

import '../widgets/single_weather.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  int _currentPage=0;
  late String bgImg;

  _onPageChanged(int index){
    setState(() {
      _currentPage=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(locationList[_currentPage].weatherType == 'Sunny') {
      bgImg = 'assests/sunny.jpg';
    } else if(locationList[_currentPage].weatherType == 'Night') {
      bgImg = 'assests/night.jpg';
    } else if(locationList[_currentPage].weatherType == 'Rainy') {
      bgImg = 'assests/rainy.jpg';
    } else if(locationList[_currentPage].weatherType == 'Cloudy') {
      bgImg = 'assests/cloudy.jpeg';
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(

        title:  const Text(""),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.search,
          size:30,
          color:Colors.white,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: GestureDetector(
              onTap: ()=>print('Menu Clicked!'),
              child: SvgPicture.asset('assests/menu.svg',
                height: 30,
                width: 30,
                color: Colors.white,

              ),
            ),
          )
        ],


      ),
      body: Container(
        child:Stack(
          children: [
            Image.asset(bgImg,
              fit:BoxFit.cover,
              height: double.infinity,
              width:double.infinity,

            ),
            Container(
              decoration: BoxDecoration(color: Colors.black38),
            ),
           Container(
             margin: EdgeInsets.only(top:140,left:15),
             child: Row(
               children: [
                 for(int i=0;i<locationList.length;i++)
                   if(i==_currentPage)
                   SliderDot(true)
                 else
                   SliderDot(false)
               ],
             ),
           ),
           PageView.builder(
             scrollDirection: Axis.horizontal,
               onPageChanged: _onPageChanged,
               itemCount: locationList.length,
               itemBuilder: (ctx,i)=>SingleWeather(i),
           ),




          ],
        )
      ),
    );
  }
}
