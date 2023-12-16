// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class Product extends StatefulWidget{
  final String title;
  final String img_url;
  final String price;
  final String id;
  final String dec;
  final Map<String, dynamic> rating;
  const Product({super.key, required this.title, required this.img_url, required this.price, required this.dec, required this.id, required this.rating});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  bool _showFullText = false;
  @override
  Widget build(BuildContext context){
    return SizedBox(
      child:Card(
        elevation: 6,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(28)),
        ),
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(widget.title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, fontFamily: 'Roboto')),
                ),

                Image.network(widget.img_url,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    Text('Price ₹${widget.price}', style: const TextStyle(fontSize: 29, fontWeight: FontWeight.bold)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(children: [
                          for (var i = 1; i < widget.rating['rate']; i++)
                            const Icon(Icons.star, color: Colors.orange, size: 14,shadows: [Shadow(color: Colors.black26, blurRadius: 2)],),
                        ],),
                        Text('Rate:${widget.rating['rate']}', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, )),
                        Text('Revied:${widget.rating['count']}', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],)
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text(
                    _showFullText ? 'Description: ${widget.dec}' : 'Description: ${widget.dec.substring(0, 50)}',
                    style: const TextStyle(fontSize: 17),
                  ),
                ),
                if (widget.dec.length > 50)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _showFullText = !_showFullText;
                        // _showFullText = true;
                      });
                    },
                    child: Text(_showFullText ? 'Show less' : 'Show more'),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: (){
                    }, style: ElevatedButton.styleFrom(backgroundColor:  Colors.deepOrange, shadowColor: Colors.brown), child: const Text('Buy', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, ))),
                    ElevatedButton(onPressed: (){},
                    style: ElevatedButton.styleFrom(backgroundColor:  Colors.deepOrange, shadowColor: Colors.brown), child: const Text('Add to cart',style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, ))),
                  ],
                ),
              ]
            )
          )
        )
    )
    );
  }
}