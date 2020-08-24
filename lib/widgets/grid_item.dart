import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl = "";
  final String city;

  GridItem(this.id, this.city, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      color: Colors.black38,
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            print("obrazek");
          },
          child: Image.network(
            'https://lh3.googleusercontent.com/proxy/du8yOdNpgHsIFM6Tc2HufYHRXh_eYNzZR6Uu2ybVQWLAv-zuYbXW5p97oQ90iYx4mQbkons7peINmvJwn7PpZTUTe-m5JW3LZAYkOA',
            fit: BoxFit.cover,
          ),
        ),
        header: Container(
          padding: EdgeInsets.only(top: 5),
          child: Stack(
            children: <Widget>[
              // Stroked text as border.
              Text(
                title,
                style: TextStyle(
                  fontSize: 25,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2
                    ..color = Colors.black,
                ),
              ),
              // Solid text as fill.
              Text(
                title,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        footer: GridTileBar(
          subtitle: Text(
            '$city',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          backgroundColor: Colors.black26,
          leading: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.star_border,
                ),
                onPressed: () => {},
              ),
              IconButton(
                icon: Icon(
                  Icons.check_circle_outline,
                ),
                onPressed: () => {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
