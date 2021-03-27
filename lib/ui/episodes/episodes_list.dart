import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/provider.dart';
import 'package:rick_and_morty/models/episode.dart';
import 'package:rick_and_morty/ui/common/abstract_list_widget.dart';
import 'package:rick_and_morty/ui/common/custom_sliver_grid_view.dart';
import 'package:rick_and_morty/ui/episodes/episode_item.dart';

class EpisodesList extends StatefulWidget {
  @override
  _EpisodesListState createState() => _EpisodesListState();
}

class _EpisodesListState extends ListState<EpisodesList, Episode> {
  @override
  Widget getContent(ScrollController? controller, List<Episode> list) {
    return CustomScrollView(controller: controller, slivers: [
      SliverToBoxAdapter(
        child: SizedBox(
          height: 16,
        ),
      ),
      CustomSliverGridView(
          items: list
              .map((e) => EpisodeItem(
                    episode: e,
                  ))
              .toList()),
    ]);
  }

  @override
  Future<List<Episode>> loadPage(int page) {
    return DataProvider.loadEpisodes(page: page);
  }
}
