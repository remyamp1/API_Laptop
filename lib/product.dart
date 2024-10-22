import 'dart:convert';
import 'package:api_laptop/data_model.dart';
import 'package:api_laptop/detali.dart';
import 'package:api_laptop/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class Api extends StatefulWidget {
  const Api({super.key});

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  bool _isLoading=true;
  @override
  void initState(){
    super.initState();
    _getData();
  }
  Productmodelapi? dataFromAPI;
  _getData() async{
    try {
      String url="https://dummyjson.com/products";
      http.Response res=await http.get(Uri.parse(url));
      if(res.statusCode ==200){
        dataFromAPI=Productmodelapi.fromJson(json.decode(res.body));
        _isLoading=false;
        setState(() {});
      }
    } catch (e) {
     debugPrint (e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API "),
        
      ),
      body: _isLoading?
      const Center(
        child: CircularProgressIndicator(),
      )
      :dataFromAPI==null?
      const Center(
        child: Text('Failed to load data'),
      )
      
     : GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 2,crossAxisSpacing: 3),
     itemCount: dataFromAPI!.products.length,
       itemBuilder: (context,index){
        final product =dataFromAPI!.products[index];
        return GestureDetector(
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>ApiDemo(
              product: product,
         
            )));
          },
          child: Container(
            height: 300,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black,
            width: 2),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 231, 223, 223),
                blurRadius: 0,
                spreadRadius: 1,
              )
            ]),
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(8.0),
           child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                    
                Image.network(product.thumbnail,width: 100,height: 65,),
            
                
                Text(product.title,style: TextStyle(fontSize: 10),),
               

                Row(
                  children: [
                    SizedBox(width: 30),
                    Text("\$${product.price.toString()}"),
                    SizedBox(width: 5),
                  GestureDetector(
                     onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Wishlist(product: product,)));
          },
                    child: Icon(Icons.favorite,size: 15,))
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}