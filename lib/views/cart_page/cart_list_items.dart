import 'package:bloc_sample/model/dummy_api_model.dart';
import 'package:flutter/material.dart';

class CartListviewItem extends StatelessWidget {
  final ProductModel item;
  const CartListviewItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Row(
        children: [
          SizedBox(
            width: 140,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  item.images.first,
                  fit: BoxFit.fill,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                         item.title,
                         overflow: TextOverflow.ellipsis,
                         maxLines: 1,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  item.category,
                  style: TextStyle(color: Colors.black54),
                ),
                const Text(
                  'Size 8',
                  style: TextStyle(color: Colors.black54),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${item.price}',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        '1 X',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
