import 'package:flutter/material.dart';
import 'package:team33_app/authentication/login_form.dart';
import 'package:team33_app/authentication/regist_form.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget girisButton = ElevatedButton(
              onPressed: () {
                FormRegistration(context);
              },
              child: const Text(
                'Giriş Yap',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(64, 212, 180, 1),
                fixedSize: const Size(256, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                shadowColor: Colors.transparent,
              ),
            );

    return Scaffold(
      backgroundColor: //Color.fromARGB(255, 0, 0, 0), 
      Color.fromARGB(255, 49, 49, 49),
   
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            const Text(
              'Hoşgeldiniz !',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            Image.asset(
             'assets/images/loggo.png',
              height: 200.0,
              width: 200,
            ),
            const SizedBox(
              height: 25,
            ),
            Column(
              children: [
            girisButton, 
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
              },
              child: const Text(
                'Misafir Olarak Devam Et',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(64, 212, 180, 1),
                fixedSize: const Size(256, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                shadowColor: Colors.transparent,
              ),
            ),
              ],
            ),

            
            
            
            const SizedBox(
              height: 45,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(children: <TextSpan>[
                TextSpan(
                  text: 'Hesaba giriş yaptığınızda ',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                TextSpan(
                  text: 'Gizlilik Sözleşmesi ',
                  style: TextStyle(
                    color: Color.fromARGB(223, 8, 207, 181),
                  ),
                ),
                TextSpan(
                  text: 'ile              ',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                TextSpan(
                  text: 'Kullanım koşullarını ',
                  style: TextStyle(
                    color: Color.fromARGB(221, 8, 207, 181),
                  ),
                ),
               TextSpan(
                  text: 'kabul etmiş sayılırsınız.',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
      
    );
    
  }
  
}



FormRegistration(BuildContext context) {
  return showModalBottomSheet(
    barrierColor: Colors.black87,
    context: context,
    backgroundColor: Color.fromRGBO(245, 245, 245, 0.871),
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(35),
    ),
    builder: (BuildContext context) {
      return Container(
        decoration: const BoxDecoration(
            color: Color.fromRGBO(245, 245, 245, 0.871),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35.0),
                topRight: Radius.circular(35.0))),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            child: Column(
              children: [
                Container(
                  height: 5,
                  width: 50,
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
                const SizedBox(
                  height: 20,
                ),
                DefaultTabController(
                    length: 2,
                    child: Column(
                      children: const [
                        TabBar(
                          indicatorColor: Color.fromARGB(69, 8, 207, 181),
                          indicatorSize: TabBarIndicatorSize.label,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          labelColor: Color.fromARGB(255, 8, 207, 181),
                          unselectedLabelColor: Color(0xff89909E),
                          tabs: <Widget>[
                            Tab(
                              text: 'Login',
                            ),
                            Tab(
                              text: 'Create Account',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 400,
                          child: TabBarView(children: [
                            LoginForm(),
                            RegistrationScreen(),
                          ]),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ]),
      );
    },
  );
}


