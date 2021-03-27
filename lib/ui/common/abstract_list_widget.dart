import 'package:flutter/material.dart';

abstract class ListState<T extends StatefulWidget, Item> extends State<T> with AutomaticKeepAliveClientMixin<T> {
  List<Item> items = [];
  ScrollController? _controller;
  int currentPage = 1;
  bool isLoading = false;

  @override
  void initState() {
    final _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.offset >= _controller.position.maxScrollExtent && !_controller.position.outOfRange) {
        if (!isLoading) {
          ++currentPage;
          _loadFeed();
        }
      }
    });
    this._controller = _controller;
    _loadFeed();
    super.initState();
  }

  Future<void> _loadFeed({bool clear = false}) async {
    setState(() {
      if (!clear) {
        isLoading = true;
      }
    });
    final List<Item> result = await loadPage(currentPage);
    setState(() {
      isLoading = false;
      if (clear == true) {
        items.clear();
      }
      items.addAll(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (items.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Stack(children: [
      RefreshIndicator(
        onRefresh: () async {
          currentPage = 1;
          _loadFeed(clear: true);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Scrollbar(
            child: getContent(_controller, items),
          ),
        ),
      ),
      _getProgress(),
    ]);
  }

  Widget _getProgress() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: isLoading
            ? const LinearProgressIndicator(
                minHeight: 6,
                backgroundColor: Colors.blue,
              )
            : Container());
  }

  @override
  bool get wantKeepAlive => true;

  Future<List<Item>> loadPage(int page);

  Widget getContent(ScrollController? controller, List<Item> list);
}
