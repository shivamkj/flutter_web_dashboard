import 'package:flutter/material.dart';

class CoomingSoon extends StatelessWidget {
  const CoomingSoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          children: const [
            SizedBox(height: 200),
            Text(
              'COOMING SOON',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
