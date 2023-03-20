import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  const CustomListItem(
      {super.key,
      required this.cust,
      required this.dates,
      required this.harga});

  final String cust;
  final String dates;
  final String harga;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: _historyDescription(
              cust: cust,
              dates: dates,
            ),
          ),
          Text(
            harga,
            style: TextStyle(
                fontFamily: 'Noto Sans',
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

// class _price extends StatelessWidget {
//   const _price({required this.harga});
//   final String harga;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text(
//         harga,
//         style: TextStyle(fontFamily: 'Noto Sans', fontSize: 15),
//       ),
//     );
//   }
// }

class _historyDescription extends StatelessWidget {
  const _historyDescription({
    required this.cust,
    required this.dates,
  });

  final String cust;
  final String dates;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              cust,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
            Text(
              dates,
              style: const TextStyle(fontSize: 15.0),
            ),
            Container(
              height: 28,
              decoration: BoxDecoration(
                  color: Color(0xffFFD18D),
                  borderRadius: BorderRadius.circular(5)),
              child: TextButton(
                onPressed: (() {}),
                child: Text(
                  "Detail",
                  style: TextStyle(
                      fontFamily: 'NotoSans',
                      fontSize: 12,
                      color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class orderHistory extends StatelessWidget {
  const orderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      itemExtent: 106.0,
      children: <CustomListItem>[
        CustomListItem(
          cust: 'Customer 1 - Completed',
          dates: '23 Feb 2023 10:10',
          harga: '50.000',
        ),
        CustomListItem(
          cust: 'Customer 2 - Canceled',
          dates: '23 Feb 2023 10:10',
          harga: '75.000',
        ),
      ],
    );
  }
}
