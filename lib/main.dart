// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:calculadora/components/botao.components.dart';
import 'package:calculadora/components/botaogrande.components.dart';
import 'package:calculadora/components/botaoicon.components.dart';
import 'package:flutter/material.dart';
 
void main() {
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 12, 22),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 29, 41),
          title: const Center(
            child: Text(
              'Calculadora',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
        ),
        body: const Calculadora(),
      ),
    );
  }
}
 
class Calculadora extends StatefulWidget {
  const Calculadora({super.key});
 
  @override
  State<Calculadora> createState() => _CalculadoraState();
}
 
class _CalculadoraState extends State<Calculadora> {
  
  String resultado = '0';
  String erro = '';
 
//função para atualizar o resultado junto com o botão
  void atualizarResultado(String texto) {
    setState(() {
      // verificar se existe + - / e X repetidos, se sim, não deixar escrever



      if (resultado == '0') {
        resultado = '';

        if (resultado.contains('+') || resultado.contains('-') || resultado.contains('x') || resultado.contains('/')) {
          int contador = 1;
        }
          
        

        resultado += texto;
       
      } else {
      resultado += texto;
      }
    });
  }
 
  //apagar
 
  void apagar() {
    setState(() {
      resultado = '0';
    });
  }
 
  void apagarUltimo() {
    setState(() {
      if (resultado.length == 1) {
        resultado = '0';
      } else {
        resultado = resultado.substring(0, resultado.length - 1);
      }
     
    });
  }
 
 
 
  void calculo() {
  setState(() {
    try{
    final operador = RegExp(r'[+-/x%]').firstMatch(resultado)?.group(0);

    if (operador != null) {
      final n1 = resultado.substring(0, resultado.indexOf(operador));
      final n2 = resultado.substring(resultado.indexOf(operador) + 1);

      if (n2.trim().isEmpty) {
        erro = ('Não há números após o operador');
        return;
      }

      switch (operador) {
        case '+':
          resultado = (int.parse(n1) + int.parse(n2)).toString();
          break;
        case '-':
          resultado = (int.parse(n1) - int.parse(n2)).toString();
          break;
        case 'x':
          resultado = (int.parse(n1) * int.parse(n2)).toString();
          break;
        case '/':
          resultado = (int.parse(n1) / int.parse(n2)).toStringAsFixed(2);
          break;
        case '%':
          resultado = (int.parse(n1) % int.parse(n2)).toString();
          break;
        default:
          erro = ('Operador desconhecido');
          break;
      }
    } else {
      erro = ('Não existe operador');
    } 
    } catch (e) {
      erro = ('Erro ao calcular');
    }
  });
}

 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(12),
          child: SizedBox(
            width: 400.0,
            height: 200.0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 30, 41, 51),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Container(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    resultado,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const Center(),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Botao(texto: 'AC', corFundo: const Color.fromARGB(255, 139, 0, 0), callback: apagar),
              Botao(texto: '()', corFundo: const Color.fromARGB(255, 42, 55, 61), callback: atualizarResultado),
              Botao(texto: '%', corFundo: const Color.fromARGB(255, 42, 55, 61), callback: atualizarResultado),
              Botao(texto: '/', corFundo: const Color.fromARGB(255, 42, 55, 61), callback: atualizarResultado),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Botao(texto: '7', corFundo: const Color.fromARGB(255, 0, 29, 41), callback: atualizarResultado),
              Botao(texto: '8', corFundo: const Color.fromARGB(255, 0, 29, 41), callback: atualizarResultado),
              Botao(texto: '9', corFundo: const Color.fromARGB(255, 0, 29, 41), callback: atualizarResultado),
              Botao(texto: 'x', corFundo: const Color.fromARGB(255, 42, 55, 61), callback: atualizarResultado),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Botao(texto: '4', corFundo: const Color.fromARGB(255, 0, 29, 41), callback: atualizarResultado),
              Botao(texto: '5', corFundo: const Color.fromARGB(255, 0, 29, 41), callback: atualizarResultado),
              Botao(texto: '6', corFundo: const Color.fromARGB(255, 0, 29, 41), callback: atualizarResultado),
              Botao(texto: '-', corFundo: const Color.fromARGB(255, 42, 55, 61), callback: atualizarResultado),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Botao(texto: '1', corFundo: const Color.fromARGB(255, 0, 29, 41), callback: atualizarResultado),
              Botao(texto: '2', corFundo: const Color.fromARGB(255, 0, 29, 41), callback: atualizarResultado),
              Botao(texto: '3', corFundo: const Color.fromARGB(255, 0, 29, 41), callback: atualizarResultado),
              Botao(texto: '+', corFundo: const Color.fromARGB(255, 42, 55, 61), callback: atualizarResultado),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Botaogrande(texto: '0', corFundo: const Color.fromARGB(255, 0, 29, 41), callback: atualizarResultado),
              BotaoIcon(
                  iconi: Icons.backspace,
                  corFundo: const Color.fromARGB(255, 0, 29, 41), callback: apagarUltimo),
              Botao(texto: '=', corFundo: const Color.fromARGB(255, 4, 65, 94), callback: calculo),
            ],
          ),
        )
      ],
    );
  }
}
 