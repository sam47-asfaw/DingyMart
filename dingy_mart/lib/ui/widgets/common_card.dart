import 'package:flutter/material.dart';

class CommonCard extends StatefulWidget {

  const CommonCard({Key? key}) : super(key: key);

  @override
  State<CommonCard> createState() => _CommonCardState();
}

class _CommonCardState extends State<CommonCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: (){
        Navigator.pushNamed(context, '/productDetail');
      },
      child: SizedBox(
        height: 300,
        width: 300,
        child: Card(
          color: Colors.blue.shade200,
          shadowColor: Colors.indigo.shade100,
          elevation: 8.0,
          borderOnForeground: true,
          shape:OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white)
          ),
          margin: const EdgeInsets.all(8.0),
          semanticContainer: true,
          child: _buildStack(context),
        ),
      ),
    );
  }

  Widget _buildStack(BuildContext context){
    return Stack(
      children: const [
        //Todo: Add Product Image
        //Todo: Add Product Detail
        //Todo: Add Buy Button
      ],
    );

  }
}
