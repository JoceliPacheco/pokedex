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

  /// Construção a partir de um ListView
  factory SimpleContentContainer.listView({
    Widget head,
    Widget bottom,
    List<dynamic> itens,
    Function itemBuilder,
    String emptyText,
    IconData emptyIcon,
  }) =>
      SimpleContentContainer(
        head: head,
        bottom: bottom,
        child: itens.isEmpty
            ? _buildEmpty(
                emptyText: emptyText,
                emptyIcon: emptyIcon,
              )
            : ListView.builder(
                itemCount: itens.length,
                itemBuilder: (_, idx) => itemBuilder(itens[idx]),
              ),
        expand: true,
      );

  static Widget _buildEmpty({
    String emptyText,
    IconData emptyIcon,
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Icon(
              emptyIcon,
              size: 48,
              color: Colors.black45,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              emptyText,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black45),
            ),
          ),
        ],
      ),
    );
  }

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
