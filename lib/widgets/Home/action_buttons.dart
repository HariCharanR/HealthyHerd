import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  final String buttonText;
  final IconData icon;
  final void Function() onPressed;

  const ActionButtons({
    super.key,
    required this.buttonText,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.only(left: 8.0 , right: 8.0 , bottom: 16),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 48),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 25,
              ),
              SizedBox(width: 8),
              Text(buttonText),
            ],
          ),
        ),
    
    );
  }
}
