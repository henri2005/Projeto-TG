import 'package:turisr/_core/appcolors.dart';
import 'package:turisr/_core/widgets/botoescomicone.dart';
import 'package:turisr/pages/recuperarsenha2_page.dart';
import 'package:flutter/material.dart';

class RecuperarPage extends StatefulWidget {
  const RecuperarPage({super.key, required this.title});

  final String title;

  @override
  State<RecuperarPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<RecuperarPage> {
  final TextEditingController _inputEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextFormField(
                  controller: _inputEmail,
                  obscureText: false,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 20,
                    ),
                    labelText: 'Email',
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color:
                            AppColors.mainColor, // mesma cor da borda ao focar
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: AppColors.mainColor,
                        width: 2,
                      ),
                    ),
                  ),
                  style: Theme.of(context).textTheme.bodyMedium,
                  validator: (value) {
                    if (value!.isEmpty || value == '') {
                      return 'Você deve informar seu nome!';
                    }

                    return null;
                  },
                ), // espaço entre o label e o campo

                BotaoIcone(
                  largura: 1,
                  altura: 0.07,
                  texto: 'Continuar',
                  icone: Icons.arrow_forward_rounded,
                  pagina: Recuperar2Page(title: '', email: _inputEmail.text),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
