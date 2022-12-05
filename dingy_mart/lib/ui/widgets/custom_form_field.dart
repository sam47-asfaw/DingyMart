import 'package:dingy_mart/ui/widgets/common_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:dingy_mart/app_theme.dart';
import 'package:dingy_mart/repository/user_dao.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unicons/unicons.dart';
import 'common_container.dart';

class CustomFormField extends StatefulWidget {
  final String buttonTitle;

 const CustomFormField({
    Key? key,
    required this.buttonTitle,
  }):super(key: key);

  @override
  _CustomFormFieldState createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  final _formKey = GlobalKey<FormState>();
  final theme = AppTheme.commonTheme();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: _formField( width: width, height: height),
    );
  }

  Widget _formField({
    required double width, height
  }){
    return Form(
        key: _formKey,
        child: Center(
          child:
            commonContainer(
             Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisSize: MainAxisSize.max,
               children: [
                      Center(
                        child: Text(
                           'DingyMart',
                           style: theme.textTheme.headline3,
                         ),
                      ),
                 const SizedBox( height: 6.0,),
                  _emailField(width: width / 1.5),
                 const SizedBox( height: 4.0,),
                  _passwordField(width: width / 1.5),
                 const SizedBox( height: 4.0,),
                 _buttonField(widget.buttonTitle, context),
                 const SizedBox( height: 4.0,),
                 Center(
                   child: Text(
                     'OR',
                     style: theme.textTheme.headline5,
                   ),
                 ),
                  _googleButtonField(context),
                  _referalLink(widget.buttonTitle, context),
                 _buildAnonymousLogin(context),
               ],
             ),
              //TODO: Add optional constraint argument
              const BoxConstraints(
                minHeight: 0,
                minWidth: 0,
                maxHeight: 550,
                maxWidth: 380,
              ),
              //TODO: Add optional decoration argument
               BoxDecoration(
                border: Border.all(
                  color: Colors.indigo.shade100,
                  width: 2.0,
                  style: BorderStyle.solid,
                ), //Border.all
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
                boxShadow:const [
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(6.0, 6.0,),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(6.0, 6.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],
              ),
            ),
        ),
    );
  }

  Widget _emailField({required double width}){
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: TextField(
          controller: _emailController,
          obscureText: false,
          decoration: InputDecoration(
            prefixIcon: Icon(
                UniconsLine.envelope_alt,
              color: Colors.indigo.shade100,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: BorderSide(
                color: Colors.indigo.shade50,
                width: 2
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: BorderSide(
                  color: Colors.indigo.shade400,
                  width: 2
              ),
            ),
            label: Text(
                'Email',
              style: theme.textTheme.headline6,
            ),
          ),
        ),
      ),
    );
  }

  Widget _passwordField({required double width}){
    return SizedBox(
      width: width ,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: Icon(
              UniconsLine.lock_alt,
              color: Colors.indigo.shade100,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: BorderSide(
                  color: Colors.indigo.shade50,
                  width: 2
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: BorderSide(
                  color: Colors.indigo.shade400,
                  width: 2
              ),
            ),
            label: Text(
              'Password',
              style: theme.textTheme.headline6,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonField(String title, BuildContext context){
    return  SizedBox(
      height: 40,
      width: 150,
      child: TextButton(
          child: Text(
              title,
              style: theme.textTheme.headline6,
          ),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue.shade50),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue.shade50),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                   RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(color: Colors.white24)
                  )
              )
          ),
          onPressed: () async{
            if(title == 'Login') {
              if(_emailController.text == "" || _passwordController.text == ""){
                showSnackBar(context, 'All fields are required');
              } else{
                User? result = await context.read<UserDAO>().signInWithEmail(
                  email: _emailController.text,
                  password: _passwordController.text,
                  context: context,
                );
                if(result != null){
                  print("success");
                  print(result.email);
                }

                Navigator.pushNamed(context, '/');
              }
            } else if(title == 'Signup'){
              if(_emailController.text == "" || _passwordController.text == ""){
                showSnackBar(context, 'All fields are required');
              } else if(_passwordController.text.length < 6){
                showSnackBar(context, 'Password has to at least 6 characters long');
              } else {
                User? result = await context.read<UserDAO>().signUpWithEmail(
                  email: _emailController.text,
                  password: _passwordController.text,
                  context: context,
                );
                if(result != null){
                  print("success");
                  print(result.email);
                }
                Navigator.pushNamed(context, '/');
              }
            }
          }
      ),
    );
  }

  Widget _googleButtonField(BuildContext context){
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 40,
        width: 250,
        child: TextButton.icon(
          style: TextButton.styleFrom(
            backgroundColor: Colors.lightBlue.shade50,
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          label: Text(
            'Continue with google',
            style: theme.textTheme.headline6,
          ),
          icon: Icon(
            FontAwesomeIcons.google,
            size: 20.0,
            color: Colors.red[600],
          ),
          onPressed: (){
            context.read<UserDAO>().signInWithGoogle(context);
            Navigator.pushNamed(context, '/');
          },
        ),

      ),
    );
  }

  Widget _referalLink(String link, BuildContext context){
    return Center(
      child: TextButton(
        child:
            Text(
              '$link' =='Signup'?
              'Already have an Account?'
                  ' Login here':
                  'Register here',
              style: theme.textTheme.headline5,
            ),
        onPressed: (){
          link == 'Login' ?
          Navigator.pushNamed(context, '/signup'):
          Navigator.pushNamed(context, '/login');
        },
      ),
    );
  }

  Widget _buildAnonymousLogin(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
         child: Text(
          'Continue',
          style: theme.textTheme.headline4,
        ),
          onPressed: () {
            context.read<UserDAO>().signInAnonymously(context);
            Navigator.pushNamed(context, '/');
          },
      ),
      ]
    );
  }


  void signUpUser(){
    context.read<UserDAO>().signUpWithEmail(
        email: _emailController.text,
        password: _passwordController.text,
        context: context,
    );
  }

  void signInUser(){
    context.read<UserDAO>().signInWithEmail(
      email: _emailController.text,
      password: _passwordController.text,
      context: context,
    );
  }
}
