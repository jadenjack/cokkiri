import 'package:flutter/material.dart';

import '../models/product.dart';

class TradePage extends StatefulWidget {
  TradePage(int id);

  final Product product = Product(
    id: 1,
    title: '노트북',
    address: '서울 금천구 가산동1',
    imageUrl: 'https://picsum.photos/id/1/300/300',
    price: 600000,
  );

  @override
  State<StatefulWidget> createState() => TradePageState(product);
}

class TradePageState extends State<TradePage> {
  TradePageState(Product product);
  var currentPaymentType;
  static const paymentTypes = ["Money", "Card", "Toss"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Text("물건명 : ${widget.product.title}"),
                  Text("주소 : ${widget.product.address}"),
                  Text("가격 : ${widget.product.price}"),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Text("결제 수단"),
                  DropdownButton<String>(
                    hint: Text("Select Device"),
                    value: currentPaymentType,
                    isDense: true,
                    onChanged: (paymentType) {
                      setState(() {
                        currentPaymentType = paymentType;
                      });
                    },
                    items: paymentTypes.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: FilledButton(
          onPressed: () {},
          child: const Text("거래 요청 완료"),
        ),
      ),
    );
  }
}
