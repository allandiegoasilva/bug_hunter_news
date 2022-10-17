import 'package:flutter/material.dart';
import 'package:bug_hunter_news/widgets/title.widget.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProgramsPage extends StatefulWidget {
  const ProgramsPage({Key? key}) : super(key: key);

  @override
  State<ProgramsPage> createState() => _ProgramsPage();
}

Widget searchInput(context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.65,
        child: TextField(
          textCapitalization: TextCapitalization.characters,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            fillColor: Color.fromARGB(255, 233, 233, 233),
            labelText: "Buscar programa",
            labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 61, 61, 61)),
            floatingLabelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 61, 61, 61)),
            suffix: Icon(Icons.search),
            focusedBorder: InputBorder.none,
          ),
        ),
      ),
    ],
  );
}

Widget _Invites() {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(item, fit: BoxFit.cover, width: 1000.0),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Text(
                            'No. ${imgList.indexOf(item)} image',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ))
      .toList();

  return Container(
    padding: EdgeInsets.symmetric(vertical: 15),
    child: Column(
      children: [
        Row(
          children: [TitleWidget(title: "Últimos convites")],
        ),
        Container(
            child: CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            initialPage: 2,
            autoPlay: false,
          ),
          items: imageSliders,
        ))
      ],
    ),
  );
}

Widget _Programs() {
  return Container(
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [TitleWidget(title: "Programas públicos")],
        ),
      ],
    ),
  );
}

class _ProgramsPage extends State<ProgramsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Todos os seus"),
                      TitleWidget(title: "Programas")
                    ],
                  ),
                )
              ],
            ),
            searchInput(context),
            _Invites(),
            _Programs()
          ],
        ),
      ),
    );
  }
}
