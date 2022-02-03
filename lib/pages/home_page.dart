import 'package:flutter/material.dart';
import 'package:flutter_routes_poc/nav.dart';
import 'package:flutter_routes_poc/pages/colors_page/blue_page.dart';
import 'package:flutter_routes_poc/pages/colors_page/green_page.dart';
import 'package:flutter_routes_poc/pages/colors_page/red_page.dart';
import 'package:flutter_routes_poc/pages/detail_page.dart';
import 'package:flutter_routes_poc/utils/books.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Book>? books;

  @override
  void initState() {
    _getBooks();
    super.initState();
  }

  _getBooks() async {
    // Fake api

    books = await booksList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            key: Key("btn_colors"),
            onPressed: _onClickColorsBtn,
            icon: Icon(Icons.color_lens),
          )
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    if (books == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        itemCount: books!.length,
        itemBuilder: (_, idx) {
          Book book = books![idx];
          return ListTile(
            key: Key("btn_${book.id}"),
            onTap: () => _onClickBtn(book.id),
            title: Text(book.name),
          );
        },
      );
    }
  }

  void _onClickBtn(int id) {
    navHelper.push(DetailPage(id: id));
  }

  void _onClickColorsBtn() {
    navHelper.pushAll([
      RedPage(),
      GreenPage(),
      BluePage(),
    ]);
  }
}
