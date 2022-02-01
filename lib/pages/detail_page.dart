import 'package:flutter/material.dart';
import 'package:flutter_routes_poc/nav.dart';

import 'package:flutter_routes_poc/utils/books.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Book? book;

  @override
  void initState() {
    _get();
    super.initState();
  }

  _get() async {
    // Fake api
    List<Book> books = await booksList(id: widget.id);
    book = books.first;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
        actions: [
          TextButton(
            key: Key("btn_pop"),
            onPressed: _onClickBtn,
            child: Text(
              "Pop",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    if (book == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Center(
        child: Text(book!.name),
      );
    }
  }

  void _onClickBtn() {
    navHelper.pop(context);
  }
}
