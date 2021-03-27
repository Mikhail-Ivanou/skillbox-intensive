import 'package:flutter/material.dart';

class CustomSliverGridView extends StatelessWidget {
  final Widget? header;
  final List<Widget> items; //TODO reimplement with builder
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;

  const CustomSliverGridView({
    Key? key,
    required this.items,
    this.crossAxisCount = 2,
    this.mainAxisSpacing = 16,
    this.crossAxisSpacing = 16,
    this.header,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          if (header != null && index == 0) {
            return header;
          }
          final realIndex = (index - (header != null ? 1 : 0)) * crossAxisCount;
          return Padding(
            padding: EdgeInsets.only(bottom: mainAxisSpacing),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: items[realIndex],
                ),
                for (var i = 1; i < crossAxisCount; i++) ...[
                  SizedBox(
                    width: crossAxisSpacing,
                  ),
                  Expanded(
                    child: (realIndex + i) >= items.length ? Container() : items[realIndex + i],
                  )
                ]
              ],
            ),
          );
        },
        childCount: (items.length / crossAxisCount).ceil() + (header != null ? 1 : 0),
      ),
    );
  }
}
