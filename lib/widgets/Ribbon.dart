import 'package:flutter/material.dart';

abstract class Ribbon<TModel> extends StatefulWidget {
  @override
  _RibbonState createState() => _RibbonState();

  Widget buildCard(BuildContext context, TModel model);

  Future<List<TModel>> getNextPage(int index);
}

class _RibbonState extends State<Ribbon> {
  ScrollController? _scrollController;
  final List _items = List.empty(growable: true);
  int _lastIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
    _addNextPage();
  }

  @override
  void dispose() {
    _scrollController?.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return Card(
            child: widget.buildCard(context, _items[index]),
            color: Colors.black38,
          );
        },
        padding: const EdgeInsets.all(50),
      ),
    );
  }

  _scrollListener() {
    print(_scrollController?.position.extentAfter);

    if (_scrollController != null && _scrollController!.position.extentAfter < 500) {
      _addNextPage();
    }
  }

  _addNextPage() async {
    List nextPageItems;

    try {
      nextPageItems = await widget.getNextPage(++_lastIndex);
    } on Exception catch (e) {
      print(e);
      nextPageItems = List.empty();
    }

    setState(() {
      _items.addAll(nextPageItems);
    });
  }
}
