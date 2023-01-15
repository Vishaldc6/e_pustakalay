import 'package:e_pustakalay/Model/BookModal.dart';
import 'package:flutter/material.dart';

class AuthorPage extends StatefulWidget {
  final List<Book> book;
  const AuthorPage({Key? key, required this.book}) : super(key: key);

  @override
  State<AuthorPage> createState() => _AuthorPageState();
}

class _AuthorPageState extends State<AuthorPage> {
  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Authors"),
      ),
      body: Container(
        height: h,
        width: w,
        color: Colors.grey[300],
        child: ListView.builder(
          itemCount: widget.book.length,
            itemBuilder: (context,index){
            return ListTile(
              title: Text("${widget.book[index].author}"),
            );
            }),
      ),
    );
  }
}
