import 'package:flutter/material.dart';

/// the custom task for create expandable floating action button
/// children: List of Floating Action button
/// icon: icon of default button
/// @return floating action button list
class ExpandableFab extends StatefulWidget {
  final List<Widget> children;
  final Icon icon;
  const ExpandableFab({Key? key, required this.children, required this.icon})
      : super(key: key);

  @override
  _ExpandableFabState createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late Icon _icon;
  late AnimationController _controller;
  late Animation<Offset> _slide;
  late Animation<double> _opacity;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _slide = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, -0.05))
        .animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        setState(() {
          _isExpanded = true;
          _icon = Icon(Icons.close);
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          _isExpanded = false;
          _icon = widget.icon;
        });
      }
    });

    _icon = widget.icon;
    super.initState();
  }

  _openAnimation() {
    _controller.forward();
  }

  _closeAnimation() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min, 
        children: [
        _isExpanded ? _expended() : SizedBox(height: 0,width: 0,),
        _isExpanded ? SizedBox(height: 0,) : SizedBox(height: 0,width: 0,),
        FloatingActionButton(
          onPressed: () {
            setState(() {
              if (_isExpanded) {
                _closeAnimation();
              } else {
                _openAnimation();
              }
            });
          },
          child: _icon,
        )
      ]),
    );
  }

  _expended() {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: SlideTransition(
        position: _slide,
        child: FadeTransition(
          opacity: _opacity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: widget.children.map((e) => InkWell(
              onTap: () => _closeAnimation(),
              child: e,
            )).toList(),
          ),
        ),
      ),
    );
  }
}
