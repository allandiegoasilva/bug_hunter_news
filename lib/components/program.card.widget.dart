import 'package:bug_hunter_news/components/price.badge.widget.dart';
import 'package:bug_hunter_news/constants/space_ui.dart';
import 'package:bug_hunter_news/controllers/program.controller.dart';
import 'package:bug_hunter_news/model/program.dart';
import 'package:bug_hunter_news/pages/detail.page.dart';
import 'package:bug_hunter_news/widgets/sub.title.widget.dart';
import 'package:flutter/material.dart';

class ProgramCardWidget extends StatefulWidget {
  ProgramCardWidget(this.program, {Key? key}) : super(key: key);

  Program program;

  @override
  State<ProgramCardWidget> createState() => _ProgramCardWidgetState();
}

class _ProgramCardWidgetState extends State<ProgramCardWidget> {
  var programController = ProgramController();

  Widget payment() {
    var minPrice = widget.program.low_min!;
    var maxPrice = widget.program.high_min!;
    var offerBounty = !(minPrice.contains('0.00') && maxPrice.contains('0.00'));

    return PriceBadgeWidget("\$ $minPrice - $maxPrice", offerBounty);
  }

  Widget favoriteIcon() => IconButton(
        onPressed: () async {
          setState(() {
            widget.program.favorite = !widget.program.favorite!;
          });

          if (widget.program.favorite!)
            return await programController.favorite(widget.program.id!);

          await programController.unfavorite(widget.program.id!);
        },
        icon: widget.program.favorite!
            ? Icon(Icons.favorite)
            : Icon(Icons.favorite_outline),
        color: Colors.red,
      );

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => DetailPage(widget.program!))),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.only(left: 5, top: 5),
        width: size.width,
        height: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.program.image!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset("assets/no-photo.png"),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          SubTitleWidget(title: widget.program.title),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                                "${widget.program.description!.substring(0, 50)}...",
                                textAlign: TextAlign.start),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              padding: EdgeInsets.all(3),
                              child: Text(
                                "Scopo: " +
                                    widget.program.scopes.length.toString(),
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Positioned(right: -5, top: -10, child: favoriteIcon())
                      ],
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Positioned(right: 0, bottom: 0, child: payment())
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
