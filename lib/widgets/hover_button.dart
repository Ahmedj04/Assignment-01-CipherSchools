import "package:flutter/material.dart";

class CustomHoverButton extends StatefulWidget {

  const CustomHoverButton({required this.text , this.autoFocus = false});

  final String text;
  final bool autoFocus;

  @override
  _CustomHoverButtonState createState() => _CustomHoverButtonState();
}

class _CustomHoverButtonState extends State<CustomHoverButton> {
  bool _isHovering = false;
  TextStyle style = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    letterSpacing: 2,
  );

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          _isHovering = true;
        });
      },
      onExit: (event) {
        setState(() {
          _isHovering = false;
        });
      },
      child: TextButton(
        autofocus: widget.autoFocus,
        onPressed: () {
          print("home pressed");
        },
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              letterSpacing: 2,
              // color: Colors.black,
            ),
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (widget.autoFocus == true || _isHovering) {
              return Color(0xFFF37D1F);
            }
            return Colors.black;
          }),
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (_isHovering) {
              return Colors.white;
            }
            return Colors.white10;
          }),
        ),
        child: Text(widget.text),
      ),
    );
  }
}
