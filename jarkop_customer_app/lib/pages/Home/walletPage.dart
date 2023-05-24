import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Wallet',
            style: TextStyle(
              fontFamily: 'NotoSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: SizedBox(
                child: Text("Rp 100.000", //Kalau bisa hubungin ke dbnya
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
                width: 300, //Nanti jangan hard code
                height: 100,
              ), 
              decoration: BoxDecoration(
                color: Color(0xffEACDA2),
                border: Border.all(
                  width: 8,
                  color: Color(0xffEACDA2),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonBar(children: [
                  ElevatedButton(
                    onPressed: (){
                      //Nanti top up berapa gitu misal 100.000
                    }, 
                    child: const Text("Top Up")
                  ),
                ],),
                ButtonBar(children: [
                  ElevatedButton(
                    onPressed: (){
                      //Gausah ada apapun hehe
                    }, 
                    child: const Text("QR Code")
                  )
                ],),
              ],
            )
          ],
        ),
    );
  }
}