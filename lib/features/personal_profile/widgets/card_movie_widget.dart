import 'package:flutter/material.dart';

class CardMovieWidget extends StatelessWidget {
  final String image;

  const CardMovieWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5 / 1,
      child: Container(
        margin: const EdgeInsets.only(right: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.3),
              ],
            ),
          ),
          child: const Align(
            child: Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 64,
            ),
          ),
        ),
      ),
    );
  }
}
