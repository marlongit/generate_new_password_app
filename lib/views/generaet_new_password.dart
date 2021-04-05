import 'package:flutter/material.dart';
import 'package:gerador_de_senha/models/passwordService.dart';
import 'package:gerador_de_senha/views/alert.dart';

class GererateNewPassword extends StatefulWidget {
  @override
  _GererateNewPasswordState createState() => _GererateNewPasswordState();
}

class _GererateNewPasswordState extends State<GererateNewPassword> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController lengthPassword = TextEditingController();
  String _infoText = "";
  bool useonlyletters = false;
  bool useonlynumber = false;
  bool useletters = false;
  bool usenumber = false;
  bool withCaractersSpecial = false;

  textFormFieldLengthPassword() {
    return TextFormField(
      controller: lengthPassword,
      keyboardType: TextInputType.number,
      style: TextStyle(fontSize: 20, color: Colors.white),
      decoration: InputDecoration(
          labelText: "Number of characters",
          labelStyle: TextStyle(fontSize: 30.0, color: Colors.white),
          fillColor: Colors.white,
          focusColor: Colors.white),
      validator: (value) {
        if (value.isEmpty) {
          return 'Entry with value';
        }
        return null;
      },
    );
  }

  onChangeOnlyLetters(bool checkValue) {
    setState(() {
      useonlyletters = checkValue;
    });
  }

  onChangeOnlyNumber(bool checkValue) {
    setState(() {
      useonlynumber = checkValue;
    });
  }

  onChangeUseLetters(bool checkValue) {
    setState(() {
      useletters = checkValue;
    });
  }

  onChangeUseNumber(bool checkValue) {
    setState(() {
      usenumber = checkValue;
    });
  }

  onChangWithCaractersSpecial(bool checkValue) {
    setState(() {
      withCaractersSpecial = checkValue;
    });
  }

  iconForm() {
    return Icon(Icons.security, size: 60.0, color: Colors.white);
  }

  buttonContainer(BuildContext context) {
    return Container(
        height: 100.0,
        width: 500,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
        margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: ElevatedButton(
            key: Key("btnSalva"),
            child: Text(
              "Generate",
              style: TextStyle(fontSize: 30.0),
            ),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.blue[300])),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                gerarNovaSenha();
                // Focus.of(context).requestFocus(new FocusNode());
              }
            }));
  }

  returnTexto(String texto) {
    return Text(texto, style: TextStyle(fontSize: 25.0));
  }

  String novaSenha = "";
  gerarNovaSenha() {
    PasswordService.gerarNewPassWord(
            usenumber,
            useletters,
            useonlynumber,
            useonlyletters,
            withCaractersSpecial,
            int.parse(lengthPassword.text))
        .then((value) => {
              alert(context, "New password", value),
              if (value.isNotEmpty) {novaSenha = value}
            })
        .whenComplete(() => null);

    // setState(() {
    //   _infoText = novaSenha;
    // });
  }

  refreshButton() {
    setState(() {
      useonlyletters = false;
      useonlynumber = false;
      useletters = false;
      usenumber = false;
      withCaractersSpecial = false;
      lengthPassword.text = "";
      _infoText = "";
    });
  }

  textInfo() {
    return Container(
        height: 100.0,
        width: 500,
        color: Colors.blue[100],
        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Text(
          _infoText,
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.blue[900], fontSize: 20.0),
        ));
  }

  _checkBoxItem(bool value, String description, ValueChanged<bool> function) {
    return CheckboxListTile(
        value: value,
        title: returnTexto(description),
        tileColor: Colors.white,
        onChanged: function);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                refreshButton();
              })
        ],
        title: Text("Generate new password"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 2, 10.0, 2),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: iconForm()),
                textFormFieldLengthPassword(),
                _checkBoxItem(useonlyletters, "Use only letters", (newchek) {
                  onChangeOnlyLetters(newchek);
                }),
                _checkBoxItem(useonlynumber, "Use only number", (newchek) {
                  onChangeOnlyNumber(newchek);
                }),
                _checkBoxItem(useletters, "Use letters", (newchek) {
                  onChangeUseLetters(newchek);
                }),
                _checkBoxItem(usenumber, "Use number", (newchek) {
                  onChangeUseNumber(newchek);
                }),
                _checkBoxItem(withCaractersSpecial, "with Caracters Special",
                    (newchek) {
                  onChangWithCaractersSpecial(newchek);
                }),
                buttonContainer(context),
                textInfo()
              ],
            )),
      ),
    );
  }
}
