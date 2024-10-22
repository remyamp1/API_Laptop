
import 'package:api_laptop/cart.dart';
import 'package:api_laptop/data_model.dart';
import 'package:flutter/material.dart';
class Wishlist extends StatelessWidget {



   final Product product;
const Wishlist({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WISHLIST',style: TextStyle(fontSize: 10,color: Colors.green),),
        actions: [
        GestureDetector
        (
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Cartpage()));
          },
          child: Icon(Icons.shopping_cart))
        ],
      ),
      body: ListView.builder(  itemCount: 1,
      itemBuilder: (context,index){
        return Container(
          child:Column(
            children: [
               Image.network(product.thumbnail),
               Row(
                children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text(product.title),
                   ),
                ],
               ),
               Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${product.price.toString()}'),
                  )   
                ],
               ),
               SizedBox(height: 70),
                Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(onPressed: (){},
             style: ElevatedButton.styleFrom(backgroundColor: 
             const Color.fromARGB(255, 236, 81, 166),
             shape: RoundedRectangleBorder()),
             child: Text('Add to Cart')),
          )
        ],
      )
            ],
          ) 
          
              
    );
      }
    
     
      
                    
      
      )
      );
  }
}