import 'package:flutter/material.dart';
import 'package:udemy_flutter/shared/components/components.dart';

class LoginScreen  extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
var emailController = TextEditingController();

var passwordController = TextEditingController();

bool isPassword = false;

var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  defaultFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validate: (value){
                        if(value!.isEmpty)
                        {
                          return 'email must not be empty';
                        }
                        return null;
                      },
                      label: 'Email Address',
                      prefix: Icons.email),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      validate: (value){
                        if(value!.isEmpty)
                        {
                          return 'email must not be empty';
                        }
                        return null;
                      },
                      label: 'Password',
                      suffix: isPassword ? Icons.visibility : Icons.visibility_off,
                      isPassword: isPassword,
                      suffixPressed: (){
                        setState(() {
                          isPassword = true;
                        });

                      },
                      prefix: Icons.lock),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                      function: (){
                          //if(formKey.currentState!.validate()) {
                           // print(emailController.text);
                           // print(passwordController.text);
                         // }

                      },
                      text: 'login'),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                      ),
                      TextButton(onPressed: (){}, child: Text(
                        'Register now'
                      ),)
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}
