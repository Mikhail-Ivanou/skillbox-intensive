import 'package:flutter/material.dart';
import 'package:flutter_2_app/data/provider.dart';
import 'package:flutter_2_app/models/person.dart';
import 'package:flutter_2_app/ui/common/abstract_list_widget.dart';
import 'package:flutter_2_app/ui/persons/person_item.dart';

class PersonsList extends StatefulWidget {
  @override
  _PersonsListState createState() => _PersonsListState();
}

class _PersonsListState extends ListState<PersonsList, Person> {
  @override
  Widget getContent(ScrollController? controller, List<Person> list) {
    return ListView.separated(
      controller: controller,
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (context, index) {
        var item = list[index];
        return PersonItem(
          item: item,
        );
      },
      itemCount: list.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 12,
        );
      },
    );
  }

  @override
  Future<List<Person>> loadPage(int page) {
    return DataProvider.loadPersons(page: page);
  }
}
