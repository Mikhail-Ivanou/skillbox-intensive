import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/provider.dart';
import 'package:rick_and_morty/models/person.dart';
import 'package:rick_and_morty/ui/common/abstract_list_widget.dart';
import 'package:rick_and_morty/ui/persons/person_item.dart';

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
