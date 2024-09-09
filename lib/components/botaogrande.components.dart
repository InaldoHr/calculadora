  import 'package:flutter/material.dart';

class Botaogrande extends StatefulWidget {
  const Botaogrande({
    super.key,
    required this.texto,
    required this.corFundo,
    required this.callback,
  });
  final String texto;
  final Color corFundo;
  final Function callback;

  @override
  State<Botaogrande> createState() => _BotaograndeState();
}

class _BotaograndeState extends State<Botaogrande> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          if (widget.texto == '=' || widget.texto == 'AC') {
            widget.callback();
          } else {
            widget.callback(widget.texto);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.corFundo,
          minimumSize: const Size(200, 90),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(
          widget.texto,
          style: const TextStyle(
            color: Color.fromARGB(255, 230, 230, 230),
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
