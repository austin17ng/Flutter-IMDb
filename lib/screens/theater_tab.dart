import 'package:flutter/cupertino.dart';
import 'package:imdb/api.dart';
import 'package:imdb/constants.dart';
import 'package:imdb/model/new_movie.dart';
import 'package:imdb/widgets/new_movie_detail_card.dart';

class TheaterTab extends StatefulWidget {
  const TheaterTab({Key? key}) : super(key: key);

  @override
  State<TheaterTab> createState() => _TheaterTabState();
}

class _TheaterTabState extends State<TheaterTab> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: ListView(
      children: [
        const SizedBox(height: 45.0),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'In theaters',
            style: headerStyle,
          ),
        ),
        const SizedBox(height: 15.0),
        SizedBox(
            width: double.infinity,
            height: 300.0,
            child: _buildMostPopularList(Api().getInTheatersMovies())),
        const SizedBox(height: 45.0),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text('Comming soon', style: headerStyle),
        ),
        const SizedBox(height: 15.0),
        SizedBox(
            width: double.infinity,
            height: 300.0,
            child: _buildMostPopularList(Api().getComingSoonMovies())),
      ],
    ));
  }

  Widget _buildMostPopularList(Future<NewMovie> newMovie) {
    return FutureBuilder<NewMovie>(
        future: newMovie,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final data = snapshot.data;
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  final detail = data!.items![index];
                  return NewMovieDetailCard(
                    data: detail,
                  );
                });
          }
          return Container(
              width: double.infinity,
              height: double.infinity,
              color: kGray,
              child: const Center(
                child: CupertinoActivityIndicator(),
              ));
        });
  }
}
