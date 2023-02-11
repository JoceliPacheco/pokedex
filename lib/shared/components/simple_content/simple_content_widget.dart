import 'package:flutter/material.dart';

class SimpleContentContainer extends StatelessWidget {
  final Widget head;
  final Widget child;
  final Widget bottom;
  final bool expand;

  const SimpleContentContainer({
    Key key,
    this.head,
    this.bottom,
    this.child,
    this.expand,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildHead(),
        _buildBody(),
        _buildBottom(),
      ],
    );
  }

  Widget _buildHead() {
    if (this.head != null) {
      return this.head;
    }
    return Container();
  }

  Widget _buildBody() {
    if (expand) {
      return Expanded(child: this.child);
    }

    return this.child;
  }

  Widget _buildBottom() {
    if (this.bottom != null) {
      return this.bottom;
    }
    return Container();
  }
}
