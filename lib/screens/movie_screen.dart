import 'package:flutter/cupertino.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:imdb/api.dart';
import 'package:imdb/constants.dart';
import 'package:imdb/model/title_data.dart';
import 'package:imdb/widgets/cast_card.dart';
import 'package:intl/intl.dart';

class MovieScreen extends StatefulWidget {
  final String id;
  const MovieScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  late Future<TitleData> titleData;
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TitleData>(
        future: titleData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text(
                  data.fullTitle,
                  style: const TextStyle(
                    color: kTextColor,
                    fontSize: 18.0,
                  ),
                ),
              ),
              child: ListView(children: [
                buildMoviePlot(data),
                const SizedBox(height: 20.0),
                buildStars(data),
                const SizedBox(height: 20.0),
                buildActorsList(data),
              ]),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(top: 500.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CupertinoActivityIndicator(),
                ],
              ),
            );
          }
        });
  }

  Widget buildActorsList(TitleData data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'Cast',
            style: headerStyle,
          ),
        ),
        const SizedBox(height: 10.0),
        SizedBox(
            width: double.infinity,
            height: 320.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  final actor = data.actorList![index];
                  return CastCard(actorShort: actor);
                })),
        const SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Directors: ",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Expanded(child: Text(data.directors)),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Writers: ",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Expanded(child: Text(data.writers)),
            ],
          ),
        ),
      ],
    );
  }

  Row buildStars(TitleData data) {
    final ratingVotes =
        NumberFormat('###,000').format(int.parse(data.imDbRatingVotes));
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            const Icon(
              FeatherIcons.star,
              color: kYellow,
            ),
            Text(
              '${data.imDbRating}/10',
              style:
                  const TextStyle(color: kYellow, fontWeight: FontWeight.w900),
            ),
            Text(
              ratingVotes,
            ),
          ],
        )
      ],
    );
  }

  Padding buildMoviePlot(TitleData data) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              data.image,
              width: 150,
              height: 275,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.0,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(10),
                        decoration:
                            BoxDecoration(border: Border.all(color: kGray)),
                        child: Text(data.year)),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Container(
                        padding: const EdgeInsets.all(10),
                        decoration:
                            BoxDecoration(border: Border.all(color: kGray)),
                        child: Text(data.contentRating)),
                    const SizedBox(
                      width: 10.0,
                    ),
                    if (data.runtimeStr != null) Container(
                        padding: const EdgeInsets.all(10),
                        decoration:
                            BoxDecoration(border: Border.all(color: kGray)),
                        child: Text(data.runtimeStr!)),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(data.plot, maxLines: 10, overflow: TextOverflow.ellipsis),
            ],
          )),
          const SizedBox(
            width: 10.0,
          ),
        ],
      ),
    );
  }

  void fetchData() {
    titleData = Api().getMovieInformation(widget.id);
    setState(() {});
  }
}
