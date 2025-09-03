import 'package:flutter/material.dart';

class ChangeQuantity extends StatefulWidget {
  final VoidCallback pressOnIncreaseProductButton;
  final VoidCallback pressOnDecreaseProductButton;
  final int productQuantity;

  const ChangeQuantity({
    super.key,
    required this.pressOnIncreaseProductButton,
    required this.pressOnDecreaseProductButton,
    required this.productQuantity,
  });

  @override
  State<ChangeQuantity> createState() => _ChangeQuantityState();
}

class _ChangeQuantityState extends State<ChangeQuantity> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: widget.pressOnIncreaseProductButton,
          icon: const Icon(
            Icons.add,
          ),
          padding: EdgeInsets.zero,
        ),
        Text(
          '${widget.productQuantity}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        IconButton(
          onPressed: widget.pressOnDecreaseProductButton,
          icon: const Icon(
            Icons.remove,
          ),
          padding: EdgeInsets.zero,
        ),
      ],
    );
  }
}
