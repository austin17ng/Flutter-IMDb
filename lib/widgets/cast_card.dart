import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imdb/constants.dart';

import '../model/title_data.dart';

class CastCard extends StatelessWidget {
  final ActorShort actorShort;

  const CastCard({Key? key, required this.actorShort}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Material(
          color: kGray,
          child: InkWell(
            onTap: () {},
            child: SizedBox(
              width: 150,
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 0.6,
                    child: Image.network(
                      "${actorShort.image}",
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
                  const SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      actorShort.name,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: defaultFont,
                        color: kTextColor,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      actorShort.asCharacter,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: defaultFont,
                        color: kTextColor,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
