import 'package:flutter/material.dart';

class RoundButton extends StatefulWidget {
  const RoundButton({
    super.key,
    required this.title,
    required this.titleSize,
    required this.fontWeight,
    required this.height,
    required this.width,
    required this.loading,
    required this.onTap,
  });

  final String title;
  final double titleSize;
  final FontWeight fontWeight;
  final double height;
  final double width;
  final bool loading;
  final VoidCallback onTap;

  @override
  State<RoundButton> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: widget.height.toDouble(),
        width: widget.width.toDouble(),
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: widget.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: widget.titleSize,
                    fontWeight: widget.fontWeight,
                  ),
                ),
              ),
      ),
    );
  }
}
