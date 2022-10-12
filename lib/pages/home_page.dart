import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:app_peliculas/models/model_peliculas.dart';
import 'package:app_peliculas/widgets/Card_Swiper.dart';
import 'package:app_peliculas/providers/peliculas_providers.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final peliculasproviders = PeliculasProviders();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi app de película'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[_SwipperTarjeta()],
        ),
      ),
    );
  }

  Widget _SwipperTarjeta() {
    return FutureBuilder(
        future: peliculasproviders.getmovies(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            return CardSwiper(
                peliculas: snapshot.data as List<ModeloPeliculas>);
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  Widget _SwiperWidget(BuildContext) {
    final _screensize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 8.0),
      child: new Swiper(
        itemCount: 5,
        layout: SwiperLayout.STACK,
        itemHeight: _screensize.height * 0.7,
        itemWidth: _screensize.width * 0.9,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.png'),
              image: NetworkImage(
                  'https://cdn.pixabay.com/photo/2022/07/27/06/43/cat-7347316__340.png'),
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
