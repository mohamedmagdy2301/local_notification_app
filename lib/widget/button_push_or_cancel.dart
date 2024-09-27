import 'package:flutter/material.dart';

class ButtonPushOrCancl extends StatelessWidget {
  const ButtonPushOrCancl({
    super.key,
    this.onPressedToPush,
    required this.text,
    this.onPressedToCancel,
  });
  final Function()? onPressedToPush, onPressedToCancel;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: ElevatedButton(
            onPressed: onPressedToPush,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 50, 132, 9),
            ),
            iconAlignment: IconAlignment.start,
            child: Text(
              "Show $text Notification",
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        IconButton(
          onPressed: onPressedToCancel,
          icon: const Icon(
            Icons.cancel,
            color: Color.fromARGB(255, 243, 123, 115),
            size: 40,
          ),
        ),
      ],
    );
  }
}
