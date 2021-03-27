import 'package:flutter/material.dart';
import 'package:flutter_2_app/data/provider.dart';
import 'package:flutter_2_app/models/episode.dart';
import 'package:flutter_2_app/models/person.dart';
import 'package:flutter_2_app/ui/common/custom_sliver_grid_view.dart';
import 'package:flutter_2_app/ui/persons/person_small_item.dart';

class EpisodeDetailsPage extends StatelessWidget {
  final Episode episode;

  const EpisodeDetailsPage({Key? key, required this.episode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Person>>(
        future: DataProvider.loadPersonDetails(getCharactersIds(episode.characters)),
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Episode'),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomScrollView(
                slivers: [
                  CustomSliverGridView(
                      header: _HeaderWidget(episode: episode),
                      items: snapshot.data?.map((e) => PersonCellWidget(person: e)).toList() ?? [])
                ],
              ),
            ),
          );
        });
  }
}

class _HeaderWidget extends StatelessWidget {
  final Episode episode;

  const _HeaderWidget({Key? key, required this.episode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(
          height: 24,
        ),
        Center(
          child: Text(
            '${episode.name}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text('Episode: ${episode.episode ?? 'NA'}'),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Air date: ${episode.airDate ?? 'NA'}',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: 8,
        ),
        Text('Characters: ${episode.characters?.length ?? 'NA'}'),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
