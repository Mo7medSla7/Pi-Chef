import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foods_app/constants.dart';
import 'package:foods_app/modules/layout/Layout_Screen.dart';
import 'package:foods_app/network/api_helper.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();
    var addressController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              SvgPicture.asset('assets/images/login.svg',height: 360),
              const Text('Join us',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),),
              const SizedBox(height: 10,),
              const Text('Enter your phone number and address',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500
                ),),
              const SizedBox(height: 20,),
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration:  InputDecoration(
                  prefixIcon: const Icon(Icons.phone,color: Colors.black26,size: 20,),
                  hintText: 'PHONE NUMBER',
                  hintStyle: const TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: addressController,
                decoration:  InputDecoration(
                  prefixIcon: const Icon(Icons.location_on,color: Colors.black26,size: 20,),
                  hintText: 'ADDRESS',
                  hintStyle: const TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                ),
              ),
              const SizedBox(height: 15,),
              ElevatedButton(

                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    minimumSize: const Size.fromHeight(50),
                ),
                  onPressed: (){
                  phoneNumber = phoneController.text;
                  address = addressController.text;
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LayoutScreen()),(route) => false,);
              },
                  child: Text('Continue'.toUpperCase(),textAlign: TextAlign.center,))
            ],
          ),
        ),
      ),
    );
  }
}
