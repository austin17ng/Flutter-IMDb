import 'package:flutter/cupertino.dart';
import 'package:imdb/api.dart';
import 'package:imdb/constants.dart';
import 'package:imdb/model/most_popular.dart';

import '../widgets/most_popular_detail_card.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: ListView(
      children: [
        const SizedBox(height: 45.0),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'Top Movies This Week',
            style: headerStyle,
          ),
        ),
        const SizedBox(height: 15.0),
        SizedBox(
            width: double.infinity,
            height: 300.0,
            child: _buildMostPopularList(Api().getMostPopularMovies())),
        const SizedBox(height: 45.0),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text('Top TVs This Week', style: headerStyle),
        ),
        const SizedBox(height: 15.0),
        SizedBox(
            width: double.infinity,
            height: 300.0,
            child: _buildMostPopularList(Api().getMostPopularTVs())),
      ],
    ));
  }

  Widget _buildMostPopularList(Future<MostPopular> mostPopular) {
    return FutureBuilder<MostPopular>(
        future: mostPopular,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final data = snapshot.data;
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  final detail = data!.items![index];
                  return MostPopularDetailCard(
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
