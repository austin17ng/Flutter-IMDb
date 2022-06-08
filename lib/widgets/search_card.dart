import 'package:flutter/material.dart';
import 'package:imdb/constants.dart';
import 'package:imdb/screens/movie_screen.dart';

class SearchCard extends StatelessWidget {
  final String id;
  final String image;
  final String title;
  final String description;

  const SearchCard({
    Key? key,
    required this.id,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Material(
          color: kGray,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MovieScreen(id: id)));
            },
            child: Row(
              children: [
                Image.network(
                  "$image",
                  fit: BoxFit.cover,
                  width: 90,
                  height: 150,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$title",
                        style: const TextStyle(
                          color: kTextColor,
                          fontFamily: defaultFont,
                          fontWeight: FontWeight.w900,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('$description', 
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: kTextColor,
                          fontFamily: defaultFont,
                          fontSize: 12,
                        ),),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
