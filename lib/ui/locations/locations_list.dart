import 'package:flutter/material.dart';
import 'package:flutter_2_app/data/provider.dart';
import 'package:flutter_2_app/models/location.dart';
import 'package:flutter_2_app/ui/common/abstract_list_widget.dart';
import 'package:flutter_2_app/ui/common/custom_sliver_grid_view.dart';
import 'package:flutter_2_app/ui/locations/location_item.dart';

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
