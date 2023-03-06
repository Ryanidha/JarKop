import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(),
                height: 90,
                width: sw,
                decoration: BoxDecoration(
                  color: Color(0xffEACDA2)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Container(
                      child: Row(
                        children: [
                          Icon(Icons.store,size: 20,),
                  TextButton(
                    onPressed: (){}, 
                    child: Text(
                      "Pick up",
                      style: TextStyle(
                        fontFamily: 'Noto Sans',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    )
                    ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Icon(Icons.location_on,size: 20,),
                  TextButton(
                    onPressed: (){}, 
                    child: Text(
                      "Drop Off",
                      style: TextStyle(
                        fontFamily: 'Noto Sans',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    )
                    ),
                        ],
                      ),
                    )
                    
                  ]),
              )
            ],
           ),
        ],
      ),
    );
  }
}
