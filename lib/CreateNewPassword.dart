import 'package:flutter/material.dart';

class NewPassword extends StatefulWidget {
  NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  TextEditingController passwordBaru = TextEditingController();
  TextEditingController ketikUlangPassword = TextEditingController();
  bool visisbilyticon = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Buat Password Baru',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(2, 82, 49, 1)),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Silakan buat password baru untuk menggantikan password lama kamu',
            style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(31, 46, 40, 1)),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Password Baru',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Color.fromARGB(255, 91, 127, 112)),
          ),
          Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ThemeData()
                    .colorScheme
                    .copyWith(primary: Color.fromRGBO(2, 82, 49, 1))),
            child: TextFormField(
              obscureText: !visisbilyticon,
              controller: passwordBaru,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        visisbilyticon = !visisbilyticon;
                      });
                    },
                    icon: Icon(
                      visisbilyticon ? Icons.visibility : Icons.visibility_off,
                      color: Color.fromRGBO(2, 82, 49, 1),
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Ketik Ulang Password',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Color.fromARGB(255, 91, 127, 112)),
          ),
          Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ThemeData()
                    .colorScheme
                    .copyWith(primary: Color.fromRGBO(2, 82, 49, 1))),
            child: TextFormField(
              obscureText: !visisbilyticon,
              controller: ketikUlangPassword,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        visisbilyticon = !visisbilyticon;
                      });
                    },
                    icon: Icon(
                      visisbilyticon ? Icons.visibility : Icons.visibility_off,
                      color: Color.fromRGBO(2, 82, 49, 1),
                    )),
              ),
            ),
          ),
          Center(
              child: Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(2, 82, 49, 1),
                  ),
                  onPressed: (() {}),
                  child: Text(
                    "Simpan",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ))
        ]),
      ),
    );
  }
}
