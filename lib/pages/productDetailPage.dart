import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../utils/numberFormat.dart';
import 'tradePage.dart';

class ProductDetailPage extends StatefulWidget {
  ProductDetailPage(int id);

  final Product product = Product(
    id: 1,
    title: '노트북',
    address: '서울 금천구 가산동1',
    imageUrl: 'https://picsum.photos/id/1/300/300',
    price: 600000,
  );

  @override
  State<StatefulWidget> createState() => ProductDetailPageState(product);
}

class ProductDetailPageState extends State<ProductDetailPage> {
  ProductDetailPageState(Product product);

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
              child: CachedNetworkImage(
                width: MediaQuery.of(context).size.width * 0.8,
                imageUrl: widget.product.imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) {
                  return Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  );
                },
                errorWidget: (context, url, error) {
                  return const Center(
                    child: Text("오류 발생"),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                widget.product.title,
                textScaler: TextScaler.linear(1.5),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "${numberFormat.format(widget.product.price)}원",
                textScaler: TextScaler.linear(1.5),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: FilledButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TradePage(widget.product.id),
              ),
            );
          },
          child: const Text("거래 요청하러 가기"),
        ),
      ),
    );
  }
}
