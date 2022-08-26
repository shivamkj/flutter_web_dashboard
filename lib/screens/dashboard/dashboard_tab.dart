import 'package:flutter/material.dart';

import '../../main.dart';
import '../../utils/constants.dart';
import '../../widgets/search_field.dart';

class DashBoardTab extends StatefulWidget {
  const DashBoardTab({this.onPressed, super.key});

  final VoidCallback? onPressed;

  @override
  State<DashBoardTab> createState() => _DashBoardTabState();
}

class _DashBoardTabState extends State<DashBoardTab> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              if (widget.onPressed != null)
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    onPressed: widget.onPressed,
                    icon: const Icon(Icons.menu),
                  ),
                ),
              Expanded(
                child: SearchField(onSearch: (v) {}),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'TOTAL CARBON OFFSETS PURCHED = ${App.preferences.getInt(boughtQuantity)}KG',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 30),
          Card(
            elevation: 6,
            color: Colors.green.shade50,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Purchase Carbon Offsets',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 50,
                    child: TextField(controller: controller),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 200,
                    child: MaterialButton(
                      onPressed: () {
                        App.preferences.setInt(buyQuantity, int.parse(controller.text));
                        Navigator.of(context).pushNamed(Routes.payment);
                      },
                      minWidth: double.infinity,
                      height: 54,
                      elevation: 12,
                      color: Colors.green.shade600,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                      child: const Text("BUY"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          const TextCard('Mint Carbon Credits - Coming soon'),
          const TextCard('Offset Carbon Footprint - Coming soon'),
          const TextCard('Trade Carbon Credit - Coming soon')
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class TextCard extends StatelessWidget {
  const TextCard(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Card(
        elevation: 6,
        color: Colors.green.shade50,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            text,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ),
    );
  }
}
