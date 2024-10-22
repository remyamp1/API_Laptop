
import 'package:api_laptop/data_model.dart';
import 'package:flutter/material.dart';

class ApiDemo extends StatelessWidget{

   final Product product;
const ApiDemo({required this.product});




 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API "),
        
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(product.thumbnail),
            Text("Name:${product.title}"),
            Text('Price:\$${product.price.toString()}')
          ],
        ),
      )
       
    );
  }
}