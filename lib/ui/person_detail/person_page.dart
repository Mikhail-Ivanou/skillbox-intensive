import 'package:flutter/material.dart';
import 'package:rick_and_morty/colors.dart';
import 'package:rick_and_morty/data/provider.dart';
import 'package:rick_and_morty/models/episode.dart';
import 'package:rick_and_morty/models/person.dart';

class PersonPage extends StatelessWidget {
  final Person person;

  const PersonPage({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Character'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                      color: person.status == 'Alive' ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(8)),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  person.status,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  maxLines: 1,
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Hero(
                  tag: person.image,
                  child: Image.network(
                    person.image,
                    width: 240,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                )),
            const SizedBox(
              height: 16,
            ),
            Text(
              person.name,
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            if (person.type.isNotEmpty) ...buildSection('Type:', person.type),
            ...buildSection('Gender:', person.gender),
            FirstEpisodeWidget(
              episodes: person.episode,
            ),
            ...buildSection('Number of episodes:', person.episode.length.toString()),
            ...buildSection('Species:', person.species),
            ...buildSection('Last known location:', person.location.name),
            ...buildSection('Origin:', person.origin.name),
          ],
        ),
      ),
    );
  }
}

List<Widget> buildSection(String label, String value) {
  return [
    Text(
      label,
      style: TextStyle(color: AppColors.greyColor),
    ),
    const SizedBox(
      height: 4,
    ),
    Text(
      value,
      style: TextStyle(color: Colors.white),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    ),
    const SizedBox(
      height: 12,
    ),
  ];
}

class FirstEpisodeWidget extends StatelessWidget {
  final List<String> episodes;
  const FirstEpisodeWidget({Key? key, required this.episodes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Episode>(
        future: DataProvider.loadEpisodeDetails(getEpisodeId(episodes.first)),
        builder: (context, snapshot) {
          return Column(
            children: buildSection('First seen:', snapshot.data?.name ?? 'Loading...'),
          );
        });
  }
}

String getEpisodeId(String url) {
  return url.substring(40);
}
