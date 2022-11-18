 Container(
        margin: EdgeInsets.symmetric(
            horizontal: SpaceUI.x20, vertical: SpaceUI.x20 / 2),
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color.fromARGB(255, 233, 233, 233)),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: size.width,
                // color: Colors.red,
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            widget.program.image!,
                            errorBuilder: (context, error, stackTrace) =>
                                ClipRRect(
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Image.asset("assets/no-photo.png"),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(right: -10, child: payment()),
              Positioned(
                  right: 0,
                  top: 0,
                  child: IconButton(
                    onPressed: () async {
                      setState(() {
                        widget.program.favorite = !widget.program.favorite!;
                      });

                      if (widget.program.favorite!)
                        return await programController
                            .favorite(widget.program.id!);

                      await programController.unfavorite(widget.program.id!);
                    },
                    icon: widget.program.favorite!
                        ? Icon(Icons.favorite)
                        : Icon(Icons.favorite_outline),
                    color: Colors.red,
                  ),)
            ],
          ),
        ),
      )