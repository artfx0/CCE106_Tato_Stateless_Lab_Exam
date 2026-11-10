import 'package:flutter/material.dart';

const Color kBlue = Color(0xFF1A56DB);
const Color kLightBlue = Color(0xFFDCE9FF);
const Color kNavy = Color(0xFF0B1B4D);
const Color kBg = Color(0xFFF1F3F8);
const Color kBorder = Color(0xFFD9DEE8);
const Color kGrey = Color(0xFF5B6475);

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
      body: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: 390,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Introduction
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: kLightBlue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'CAMPUS STORE',
                    style: TextStyle(
                      color: kBlue,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Ready for checkout',
                  style: TextStyle(
                    color: kNavy,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Review your items before placing your order.',
                  style: TextStyle(color: kGrey, fontSize: 14),
                ),
                const SizedBox(height: 16),

                // Delivery card
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: _cardDecoration(),
                  child: Row(
                    children: [
                      const Icon(Icons.location_on, color: kBlue, size: 30),
                      const SizedBox(width: 12),
                      Container(width: 1, height: 40, color: kBorder),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Deliver to Glenn Oliva',
                              style: TextStyle(
                                color: kNavy,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Matina, Davao City',
                              style: TextStyle(color: kGrey, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () =>
                            debugPrint('Change delivery address clicked'),
                        child: const Text(
                          'Change',
                          style: TextStyle(
                            color: kBlue,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Order items header
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Order Items',
                      style: TextStyle(
                        color: kNavy,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      '3 items',
                      style: TextStyle(color: kGrey, fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                const CartItemCard(
                  name: 'Wireless Mouse',
                  price: 'PHP 450.00',
                  quantity: 1,
                  icon: Icons.mouse_outlined,
                ),
                const SizedBox(height: 12),
                const CartItemCard(
                  name: 'USB-C Hub',
                  price: 'PHP 850.00',
                  quantity: 1,
                  icon: Icons.usb,
                ),
                const SizedBox(height: 12),
                const CartItemCard(
                  name: 'Laptop Stand',
                  price: 'PHP 700.00',
                  quantity: 1,
                  icon: Icons.laptop_mac,
                ),
                const SizedBox(height: 16),

                // Discount banner
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: kLightBlue,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.sell_outlined, color: kBlue, size: 28),
                      const SizedBox(width: 12),
                      Container(width: 1, height: 36, color: kGrey),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'STUDENT10 applied',
                              style: TextStyle(
                                color: kBlue,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '10% discount on items',
                              style: TextStyle(color: kGrey, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.check_circle, color: kBlue, size: 32),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Payment summary
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: _cardDecoration(),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Payment Summary',
                        style: TextStyle(
                          color: kNavy,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 8),
                      SummaryRow(label: 'Subtotal', amount: 'PHP 2,000.00'),
                      SummaryRow(
                        label: 'Discount (10%)',
                        amount: '- PHP 200.00',
                      ),
                      SummaryRow(label: 'Delivery Fee', amount: 'PHP 50.00'),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Divider(height: 1, color: kBorder),
                      ),
                      SummaryRow(
                        label: 'Total',
                        amount: 'PHP 1,850.00',
                        bold: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Place order
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kBlue,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () =>
                        debugPrint('Place order clicked! Total: PHP 1850.00'),
                    icon: const Icon(Icons.lock),
                    label: const Text(
                      'Place Order',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

BoxDecoration _cardDecoration() => BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(16),
  border: Border.all(color: kBorder),
);

class CartItemCard extends StatelessWidget {
  final String name;
  final String price;
  final int quantity;
  final IconData icon;

  const CartItemCard({
    super.key,
    required this.name,
    required this.price,
    required this.quantity,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: _cardDecoration(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: kLightBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: kNavy, size: 40),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: kNavy,
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  price,
                  style: const TextStyle(
                    color: kBlue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _QtyButton(
                      icon: Icons.remove,
                      onPressed: () => debugPrint('Decrease quantity: $name'),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 44,
                      height: 34,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kBorder),
                      ),
                      child: Text(
                        '$quantity',
                        style: const TextStyle(
                          color: kNavy,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    _QtyButton(
                      icon: Icons.add,
                      onPressed: () => debugPrint('Increase quantity: $name'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
            icon: const Icon(Icons.delete_outline, color: kGrey, size: 26),
            onPressed: () => debugPrint('Remove item: $name'),
          ),
        ],
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _QtyButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 34,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          side: const BorderSide(color: kBlue, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Icon(icon, color: kBlue, size: 20),
      ),
    );
  }
}

class SummaryRow extends StatelessWidget {
  final String label;
  final String amount;
  final bool bold;

  const SummaryRow({
    super.key,
    required this.label,
    required this.amount,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: kNavy,
      fontSize: bold ? 20 : 16,
      fontWeight: bold ? FontWeight.w800 : FontWeight.normal,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
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
