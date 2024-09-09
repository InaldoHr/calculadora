import 'package:flutter/material.dart';
 
class BotaoIcon extends StatefulWidget {
  const BotaoIcon({super.key, required this.iconi, required this.corFundo, required this.callback,});
  final IconData iconi;
  final Function callback;
  final Color corFundo;
 
 
  @override
  State<BotaoIcon> createState() => _BotaoIconState();
}
 
class _BotaoIconState extends State<BotaoIcon> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FloatingActionButton.large(
        onPressed: () {
          widget.callback();
        },
        backgroundColor: widget.corFundo,
        child: Icon(
          widget.iconi,
          color: const Color.fromARGB(255, 230, 230, 230),
        ),
 
      ),
    );
  }
}
 