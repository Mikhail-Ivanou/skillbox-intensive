import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/provider.dart';
import 'package:rick_and_morty/models/location.dart';
import 'package:rick_and_morty/ui/common/abstract_list_widget.dart';
import 'package:rick_and_morty/ui/common/custom_sliver_grid_view.dart';
import 'package:rick_and_morty/ui/locations/location_item.dart';

class LocationsList extends StatefulWidget {
  @override
  _LocationsListState createState() => _LocationsListState();
}

class _LocationsListState extends ListState<LocationsList, Location> {
  @override
  Widget getContent(ScrollController? controller, List<Location> list) {
    return CustomScrollView(controller: controller, slivers: [
      SliverToBoxAdapter(
        child: SizedBox(
          height: 16,
        ),
      ),
      CustomSliverGridView(items: list.map((e) => LocationItem(location: e)).toList()),
    ]);
  }

  @override
  Future<List<Location>> loadPage(int page) {
    return DataProvider.loadLocations(page: page);
  }
}
