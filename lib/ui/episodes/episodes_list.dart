import 'package:flutter/material.dart';
import 'package:flutter_2_app/data/provider.dart';
import 'package:flutter_2_app/models/episode.dart';
import 'package:flutter_2_app/ui/common/abstract_list_widget.dart';
import 'package:flutter_2_app/ui/common/custom_sliver_grid_view.dart';
import 'package:flutter_2_app/ui/episodes/episode_item.dart';

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
