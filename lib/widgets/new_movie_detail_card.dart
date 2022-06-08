import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imdb/constants.dart';
import 'package:imdb/model/new_movie.dart';
import 'package:imdb/screens/movie_screen.dart';

class NewMovieDetailCard extends StatelessWidget {
  final NewMovieDetail data;
  const NewMovieDetailCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Material(
          color: kGray,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MovieScreen(id: "${data.id}")));
            },
            child: SizedBox(
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 0.6,
                    child: Image.network(
                      "${data.image}",
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return const Center(
                          child: CupertinoActivityIndicator(),
                        );
                      },
                    ),
                  ),
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                    child: Text(
                        "${data.title}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: kTextColor,
                        ),
                    ),
                  ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
