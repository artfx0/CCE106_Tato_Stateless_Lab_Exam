import 'dart:math' as math;

import 'package:flutter/material.dart';

const Color kBlue = Color(0xFF1A56DB);
const Color kLightBlue = Color(0xFFDCE9FF);
const Color kNavy = Color(0xFF0B1B4D);
const Color kBg = Color(0xFFF1F3F8);
const Color kBorder = Color(0xFFD9DEE8);
const Color kGrey = Color(0xFF5B6475);

const double _designWidth = 390;
const double _designHeight = 940;

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: kNavy),
          onPressed: () => debugPrint('Back clicked'),
        ),
        title: const Text(
          'My Cart',
          style: TextStyle(
            color: kNavy,
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                    color: kNavy,
                    size: 28,
                  ),
                  onPressed: () => debugPrint('Cart clicked'),
                ),
                Positioned(
                  top: 6,
                  right: 4,
                  child: IgnorePointer(
                    child: Container(
                      width: 18,
                      height: 18,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: kBlue,
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        '3',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, box) {
          // Scale factor from available width AND height, so nothing overflows.
          final double u = math
              .min(box.maxWidth / _designWidth, box.maxHeight / _designHeight)
              .clamp(0.5, 1.4);
          final double pad = 16 * u;

          return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: TextScaler.noScaling),
            child: Padding(
              padding: EdgeInsets.all(pad),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _intro(u),
                  _deliveryCard(u),
                  _orderItems(u),
                  _discountBanner(u),
                  _paymentSummary(u),
                  _placeOrderButton(u),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _intro(double u) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10 * u, vertical: 4 * u),
          decoration: BoxDecoration(
            color: kLightBlue,
            borderRadius: BorderRadius.circular(8 * u),
          ),
          child: Text(
            'CAMPUS STORE',
            style: TextStyle(
              color: kBlue,
              fontSize: 12 * u,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 8 * u),
        Text(
          'Ready for checkout',
          style: TextStyle(
            color: kNavy,
            fontSize: 30 * u,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: 4 * u),
        Text(
          'Review your items before placing your order.',
          style: TextStyle(color: kGrey, fontSize: 14 * u),
        ),
      ],
    );
  }

  Widget _deliveryCard(double u) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16 * u, vertical: 10 * u),
      decoration: _cardDecoration(u),
      child: Row(
        children: [
          Icon(Icons.location_on, color: kBlue, size: 30 * u),
          SizedBox(width: 12 * u),
          Container(width: 1, height: 40 * u, color: kBorder),
          SizedBox(width: 12 * u),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Deliver to Glenn Oliva',
                  style: TextStyle(
                    color: kNavy,
                    fontSize: 16 * u,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2 * u),
                Text(
                  'Matina, Davao City',
                  style: TextStyle(color: kGrey, fontSize: 14 * u),
                ),
              ],
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 4 * u),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () => debugPrint('Change delivery address clicked'),
            child: Text(
              'Change',
              style: TextStyle(
                color: kBlue,
                fontSize: 15 * u,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _orderItems(double u) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Order Items',
              style: TextStyle(
                color: kNavy,
                fontSize: 20 * u,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              '3 items',
              style: TextStyle(color: kGrey, fontSize: 14 * u),
            ),
          ],
        ),
        SizedBox(height: 10 * u),
        CartItemCard(
          name: 'Wireless Mouse',
          price: 'PHP 450.00',
          quantity: 1,
          icon: Icons.mouse_outlined,
          scale: u,
        ),
        SizedBox(height: 10 * u),
        CartItemCard(
          name: 'USB-C Hub',
          price: 'PHP 850.00',
          quantity: 1,
          icon: Icons.usb,
          scale: u,
        ),
        SizedBox(height: 10 * u),
        CartItemCard(
          name: 'Laptop Stand',
          price: 'PHP 700.00',
          quantity: 1,
          icon: Icons.laptop_mac,
          scale: u,
        ),
      ],
    );
  }

  Widget _discountBanner(double u) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16 * u, vertical: 10 * u),
      decoration: BoxDecoration(
        color: kLightBlue,
        borderRadius: BorderRadius.circular(14 * u),
      ),
      child: Row(
        children: [
          Icon(Icons.sell_outlined, color: kBlue, size: 28 * u),
          SizedBox(width: 12 * u),
          Container(width: 1, height: 36 * u, color: kGrey),
          SizedBox(width: 12 * u),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'STUDENT10 applied',
                  style: TextStyle(
                    color: kBlue,
                    fontSize: 16 * u,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '10% discount on items',
                  style: TextStyle(color: kGrey, fontSize: 13 * u),
                ),
              ],
            ),
          ),
          Icon(Icons.check_circle, color: kBlue, size: 32 * u),
        ],
      ),
    );
  }

  Widget _paymentSummary(double u) {
    return Container(
      padding: EdgeInsets.all(16 * u),
      decoration: _cardDecoration(u),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Summary',
            style: TextStyle(
              color: kNavy,
              fontSize: 20 * u,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 6 * u),
          SummaryRow(label: 'Subtotal', amount: 'PHP 2,000.00', scale: u),
          SummaryRow(label: 'Discount (10%)', amount: '- PHP 200.00', scale: u),
          SummaryRow(label: 'Delivery Fee', amount: 'PHP 50.00', scale: u),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6 * u),
            child: const Divider(height: 1, color: kBorder),
          ),
          SummaryRow(
            label: 'Total',
            amount: 'PHP 1,850.00',
            bold: true,
            scale: u,
          ),
        ],
      ),
    );
  }

  Widget _placeOrderButton(double u) {
    return SizedBox(
      width: double.infinity,
      height: 54 * u,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: kBlue,
          foregroundColor: Colors.white,
          elevation: 0,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14 * u),
          ),
        ),
        onPressed: () => debugPrint('Place order clicked! Total: PHP 1850.00'),
        icon: Icon(Icons.lock, size: 22 * u),
        label: Text(
          'Place Order',
          style: TextStyle(
            fontSize: 18 * u,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

BoxDecoration _cardDecoration(double u) => BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(16 * u),
  border: Border.all(color: kBorder),
);

class CartItemCard extends StatelessWidget {
  final String name;
  final String price;
  final int quantity;
  final IconData icon;
  final double scale;

  const CartItemCard({
    super.key,
    required this.name,
    required this.price,
    required this.quantity,
    required this.icon,
    this.scale = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    final double u = scale;
    return Container(
      padding: EdgeInsets.all(10 * u),
      decoration: _cardDecoration(u),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 72 * u,
            height: 72 * u,
            decoration: BoxDecoration(
              color: kLightBlue,
              borderRadius: BorderRadius.circular(12 * u),
            ),
            child: Icon(icon, color: kNavy, size: 40 * u),
          ),
          SizedBox(width: 12 * u),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: kNavy,
                    fontSize: 17 * u,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  price,
                  style: TextStyle(
                    color: kBlue,
                    fontSize: 16 * u,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6 * u),
                Row(
                  children: [
                    _QtyButton(
                      icon: Icons.remove,
                      scale: u,
                      onPressed: () => debugPrint('Decrease quantity: $name'),
                    ),
                    SizedBox(width: 8 * u),
                    Container(
                      width: 44 * u,
                      height: 34 * u,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10 * u),
                        border: Border.all(color: kBorder),
                      ),
                      child: Text(
                        '$quantity',
                        style: TextStyle(
                          color: kNavy,
                          fontSize: 15 * u,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 8 * u),
                    _QtyButton(
                      icon: Icons.add,
                      scale: u,
                      onPressed: () => debugPrint('Increase quantity: $name'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            style: IconButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            constraints: BoxConstraints(minWidth: 36 * u, minHeight: 36 * u),
            icon: Icon(Icons.delete_outline, color: kGrey, size: 26 * u),
            onPressed: () => debugPrint('Remove item: $name'),
          ),
        ],
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final double scale;
  final VoidCallback onPressed;

  const _QtyButton({
    required this.icon,
    required this.scale,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40 * scale,
      height: 34 * scale,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          side: const BorderSide(color: kBlue, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10 * scale),
          ),
        ),
        onPressed: onPressed,
        child: Icon(icon, color: kBlue, size: 20 * scale),
      ),
    );
  }
}

class SummaryRow extends StatelessWidget {
  final String label;
  final String amount;
  final bool bold;
  final double scale;

  const SummaryRow({
    super.key,
    required this.label,
    required this.amount,
    this.bold = false,
    this.scale = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: kNavy,
      fontSize: (bold ? 20 : 16) * scale,
      fontWeight: bold ? FontWeight.w800 : FontWeight.normal,
    );
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2 * scale),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: style),
          Text(amount, style: style),
        ],
      ),
    );
  }
}
