class Book {
  final int id;
  final String name;

  Book({
    required this.id,
    required this.name,
  });
}

Future<List<Book>> booksList({int? id}) async {
  await Future.delayed(Duration(seconds: 1));

  List<Book> list = [
    Book(id: 1, name: "Livro 1"),
    Book(id: 2, name: "Livro 2"),
    Book(id: 3, name: "Livro 3"),
    Book(id: 4, name: "Livro 4"),
    Book(id: 5, name: "Livro 5"),
    Book(id: 6, name: "Livro 6"),
    Book(id: 7, name: "Livro 7"),
    Book(id: 8, name: "Livro 8"),
    Book(id: 9, name: "Livro 9"),
    Book(id: 10, name: "Livro 10"),
  ];

  if (id == null) {
    return list;
  } else {
    return list.where((element) => element.id == id).toList();
  }
}
