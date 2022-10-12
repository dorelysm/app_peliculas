import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:app_peliculas/models/model_peliculas.dart';

class CardSwiper extends StatelessWidget {
  final List<ModeloPeliculas> peliculas;

  CardSwiper({required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screensize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 8.0),
      child: new Swiper(
        itemCount: peliculas.length,
        layout: SwiperLayout.STACK,
        itemWidth: _screensize.width * 0.7,
        itemHeight: _screensize.height * 0.9,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(peliculas[index].getposterImg()),
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
