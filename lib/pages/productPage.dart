import 'package:cached_network_image/cached_network_image.dart';

import '../models/product.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:styled_widget/styled_widget.dart';

import '../utils/numberFormat.dart';
import 'productDetailPage.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<StatefulWidget> createState() => ProductPageState();
}

class ProductPageState extends State<ProductPage> {
  final NumberFormat numberFormat = NumberFormat('###,###,###,###');

  List<Product> products = [
    Product(
        id: 1,
        title: '노트북',
        address: '서울 금천구 가산동1',
        imageUrl: 'https://picsum.photos/id/1/300/300',
        price: 600000),
    Product(
        id: 2,
        title: '스마트폰',
        address: '서울 강남구 역삼동',
        imageUrl: 'https://picsum.photos/id/20/300/300',
        price: 500000),
    Product(
        id: 3,
        title: '머그컵',
        address: '서울 강남구 신사동',
        imageUrl: 'https://picsum.photos/id/30/300/300',
        price: 150000),
    Product(
        id: 4,
        title: '키보드',
        address: '서울 강남구 세곡동',
        imageUrl: 'https://picsum.photos/id/60/300/300',
        price: 50000),
    Product(
        id: 5,
        title: '포도',
        address: '서울 강남구 도곡동',
        imageUrl: 'https://picsum.photos/id/575/300/300',
        price: 75000),
    Product(
        id: 6,
        title: '책',
        address: '서울 강남구 일원동',
        imageUrl: 'https://picsum.photos/id/24/300/300',
        price: 24000),
    Product(
        id: 1,
        title: '노트북',
        address: '서울 금천구 가산동',
        imageUrl: 'https://picsum.photos/id/1/300/300',
        price: 600000),
    Product(
        id: 2,
        title: '스마트폰',
        address: '서울 강남구 역삼동',
        imageUrl: 'https://picsum.photos/id/20/300/300',
        price: 500000),
    Product(
        id: 3,
        title: '머그컵',
        address: '서울 강남구 신사동',
        imageUrl: 'https://picsum.photos/id/30/300/300',
        price: 150000),
    Product(
        id: 4,
        title: '키보드',
        address: '서울 강남구 세곡동',
        imageUrl: 'https://picsum.photos/id/60/300/300',
        price: 50000),
    Product(
        id: 5,
        title: '포도',
        address: '서울 강남구 도곡동',
        imageUrl: 'https://picsum.photos/id/575/300/300',
        price: 75000),
    Product(
        id: 6,
        title: '책',
        address: '서울 강남구 일원동',
        imageUrl: 'https://picsum.photos/id/24/300/300',
        price: 24000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductContainer(context, products[index]);
        },
      ),
    );
  }
}

class ProductContainer extends Container {
  ProductContainer(BuildContext context, Product product)
      : super(
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(product.id),
                ),
              );
            },
            child: Padding(
              // Following padding to give space around the icon and text
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: product.imageUrl,
                    placeholder: (context, url) {
                      return const Center(
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
                  SizedBox(width: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        product.title,
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        product.address,
                        softWrap: true,
                      )
                    ],
                  ),
                  Spacer(),
                  Text(
                    "${numberFormat.format(product.price)}원",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
}
