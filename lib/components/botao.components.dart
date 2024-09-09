import 'package:flutter/material.dart';
 
class Botao extends StatefulWidget {
  const Botao({super.key, required this.texto, required this.corFundo, required this.callback,
  });
  final String texto;
  final Color corFundo;
  final Function callback;

 
  @override
  State<Botao> createState() => _BotaoState();
}
 
class _BotaoState extends State<Botao> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FloatingActionButton.large(
        
        
          onPressed: () {
            if (widget.texto == '=' || widget.texto == 'AC') {
              widget.callback();
            }else{
            widget.callback(widget.texto);
            }
          },
          backgroundColor: widget.corFundo,
          child: Text(
            widget.texto,
            style: const TextStyle(color: Color.fromARGB(255, 230, 230, 230), fontSize: 40),
          )),
    );
  }
}