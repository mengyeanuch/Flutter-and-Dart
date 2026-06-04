import 'package:flutter/material.dart';

enum IconPos {
  left("left"),
  right("right");

  final String pos;
  const IconPos(this.pos);
}

enum ButtonType {
  primary(Colors.blue),
  secondary(Colors.green),
  disabled(Colors.grey);

  final Color bg;
  const ButtonType(this.bg);
}

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPos position;
  final ButtonType type;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.position = IconPos.left,
    this.type = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    if (position == IconPos.left) {
      return Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: type.bg,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(label),
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: type.bg,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(label),
            ),
            Icon(icon),
          ],
        ),
      );
    }
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsetsGeometry.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomButton(label: "Submit", icon: Icons.check),
              CustomButton(
                label: "Time",
                icon: Icons.timer,
                type: ButtonType.secondary,
                position: IconPos.right,
              ),
              CustomButton(
                label: "Account",
                icon: Icons.account_tree_outlined,
                type: ButtonType.disabled,
                position: IconPos.right,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
