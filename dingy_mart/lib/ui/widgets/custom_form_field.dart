import 'package:dingy_mart/app_theme.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unicons/unicons.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _formField(),
    );
  }

  Widget _formField(){
    return Form(
        key: _formKey,
        child: Center(
          child:
            _commonContainer(
              //TODO: Add child widget argument
             Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 SizedBox(
                   width: 300,
                   height: 100,
                   child: _commonContainer(
                     //Todo: Add child widget argument
                      Center(
                        child: Text(
                           'DingyMart',
                           style: theme.textTheme.headline3,
                         ),
                      ),
                     const BoxConstraints(
                       minWidth: 0,
                       minHeight: 0,
                       maxWidth: 50.0,
                       maxHeight: 50.0,
                     ),

                   ),
                 ),
                  _emailField(),

                 const SizedBox( height: 12.0,),

                  _passwordField(),

                 const SizedBox( height: 10.0,),

                 _buttonField(widget.buttonTitle, context),

                 const SizedBox( height: 10.0,),

                 Center(
                   child: Text(
                     'OR',
                     style: theme.textTheme.headline4,
                   ),
                 ),
                  _googleButtonField(widget.buttonTitle, context),
                  _referalLink(widget.buttonTitle, context),
                 const SizedBox( height: 30.0,),
                 _buildAnnonymousLogin(context),
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

  Widget _emailField(){
    return SizedBox(
      width: 280,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: TextField(
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

  Widget _passwordField(){
    return SizedBox(
      width: 280,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: TextField(
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
      height: 50,
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
          onPressed: () => (){
            Navigator.pushNamed(context, '/');
          }
      ),
    );
  }

  Widget _googleButtonField(String title, BuildContext context){
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        width: 250,
        child: TextButton.icon(
          style: TextButton.styleFrom(
            backgroundColor: Colors.lightBlue.shade50,
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          label: Text(
            '$title with google',
            style: theme.textTheme.headline6,
          ),
          icon: Icon(
            FontAwesomeIcons.google,
            size: 30.0,
            color: Colors.red[600],
          ),
          onPressed: (){
            Navigator.pushNamed(context, '/');
          },
        ),

      ),
    );
  }

  Widget _commonContainer(Widget child, [BoxConstraints? _constraints, BoxDecoration? _decoration]){
    return Container(
      constraints: _constraints,
      decoration: _decoration,
      child: child,
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

  Widget _buildAnnonymousLogin(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
        child: Text(
          'Continue',
          style: theme.textTheme.headline4,
        ),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
      ),
      ]
    );
  }
}
