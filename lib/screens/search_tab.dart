import 'package:flutter/cupertino.dart';
import 'package:imdb/api.dart';
import 'package:imdb/constants.dart';
import 'package:imdb/model/search_data.dart';
import 'package:imdb/widgets/search_card.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({Key? key}) : super(key: key);

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  late Future<SearchData>? searchData;

  @override
  void initState() {
    super.initState();
    searchData = null;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        // navigationBar: CupertinoNavigationBar(
        //   middle:
        // ),
        child: ListView(children: [
      const SizedBox(height: 45.0),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SizedBox(
          height: 40.0,
          child: CupertinoSearchTextField(
            borderRadius: BorderRadius.circular(10.0),
            prefixInsets:
                const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 10.0, 10.0),
            prefixIcon: const Icon(CupertinoIcons.search),
            itemColor: kTextColor,
            backgroundColor: kGray,
            placeholder: 'Search IMDb',
            placeholderStyle: const TextStyle(
              color: kTextSecondaryColor,
            ),
            suffixIcon: const Icon(CupertinoIcons.xmark_circle_fill),
            suffixInsets:
                const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 20.0, 10.0),
            onSubmitted: (text) => {searchxxx(text), print(text)},
          ),
        ),
      ),
      const SizedBox(
        height: 30,
      ),
      (searchData != null) ? _buildSearchResults() : Container(),
    ]));
  }

  Widget _buildSearchResults() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: FutureBuilder<SearchData>(
        future: searchData,
        builder: (context, snapshot) {
          // if (snapshot.hasData) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: snapshot.data!.results.length,
                itemBuilder: (context, index) {
                  final searchResult = snapshot.data!.results[index];
                  return SearchCard(
                    id: searchResult.id,
                    image: searchResult.image,
                    title: searchResult.title,
                    description: searchResult.description,
                  );
                });
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Padding(
            padding: const EdgeInsets.only(top: 300),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CupertinoActivityIndicator(),
              ],
            ),
          );
        },
      ),
    );
  }

  void searchxxx(String expression) async {
    searchData = Api().search(expression);
    setState(() {});
  }
}
