import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';
import 'navigation_bar_item.dart';

// ignore: must_be_immutable
class BottomIndicatorBar extends StatefulWidget {
  final Color indicatorColor;

  final TextStyle? activeStyle;
  final TextStyle? inactiveStyle;

  /// Specify the indicator bar height. (Set to 0 to hide the indicator bar)
  final double indicatorHeight;
  final double indicatorWidth;
  final Color backgroundColor;
  final bool shadow;
  final double iconSize;
  final double barHeight;
  int currentIndex;
  final ValueChanged<int> onTap;
  final List<BottomIndicatorNavigationBarItem> items;

  BottomIndicatorBar({
    Key? key,
    required this.onTap,
    required this.items,
    this.indicatorColor = Colors.grey,
    this.backgroundColor = Colors.white,
    this.indicatorHeight = 2,
    this.indicatorWidth = 22,
    this.activeStyle,
    this.inactiveStyle,
    this.iconSize = 35.0,
    this.barHeight = 60,
    this.shadow = true,
    this.currentIndex = 0,
  }) : super(key: key);

  @override
  State createState() => _BottomIndicatorBarState();
}

class _BottomIndicatorBarState extends State<BottomIndicatorBar> {
  //static const double INDICATOR_HEIGHT = 2;

  List<BottomIndicatorNavigationBarItem> get items => widget.items;

  double width = 0;
  late Color activeColor;
  late Color inactiveColor;
  Duration duration = const Duration(milliseconds: 170);

  double? _getIndicatorPosition(int index) {
    var isLtr = Directionality.of(context) == TextDirection.ltr;
    if (isLtr) {
      return lerpDouble(-1.0, 1.0, index / (items.length - 1));
    } else {
      return lerpDouble(1.0, -1.0, index / (items.length - 1));
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    activeColor = widget.activeStyle?.color ?? Colors.black;
    inactiveColor = widget.inactiveStyle?.color ?? Colors.grey;

    return Container(
      height: widget.barHeight + MediaQuery.of(context).viewPadding.bottom,
      width: width,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        boxShadow: widget.shadow
            ? [
                const BoxShadow(color: Colors.black12, blurRadius: 10),
              ]
            : null,
      ),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Positioned(
            top: widget.indicatorHeight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: items.map((item) {
                var index = items.indexOf(item);
                return GestureDetector(
                  onTap: () => _select(index, item),
                  child: _buildItemWidget(item, index == widget.currentIndex),
                );
              }).toList(),
            ),
          ),
          Positioned(
            top: 0,
            width: width,
            child: AnimatedAlign(
              alignment:
                  Alignment(_getIndicatorPosition(widget.currentIndex)!, 0),
              curve: Curves.linear,
              duration: duration,
              child: SizedBox(
                width: width / items.length,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.indicatorColor,
                      borderRadius: BorderRadius.all(
                          Radius.circular(widget.indicatorHeight / 2)),
                    ),
                    width: widget.indicatorWidth,
                    height: widget.indicatorHeight,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _select(int index, BottomIndicatorNavigationBarItem item) {
    widget.currentIndex = index;
    widget.onTap(widget.currentIndex);

    setState(() {});
  }

  Widget _setIcon(BottomIndicatorNavigationBarItem item, bool isSelected) {
    return Image(
      image: AssetImage(
        item.icon,
      ),
      color: isSelected ? activeColor : inactiveColor,
    );
  }

  Widget _setLabel(BottomIndicatorNavigationBarItem item, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        item.label,
        style: isSelected ? widget.activeStyle : widget.inactiveStyle,
      ),
    );
  }

  Widget _buildItemWidget(
      BottomIndicatorNavigationBarItem item, bool isSelected) {
    return Container(
      color: item.backgroundColor,
      height: widget.barHeight,
      width: width / items.length,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: [
              _setIcon(item, isSelected),
              _setLabel(item, isSelected),
            ],
          ),
        ],
      ),
    );
  }
}
