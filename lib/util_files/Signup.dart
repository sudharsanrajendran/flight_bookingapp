
import 'package:flight_bookingapp/util_files/providerdata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Login.dart';
class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  GlobalKey<FormState> formkey =GlobalKey();
  TextEditingController  Username= TextEditingController();
  TextEditingController passwordcontroller= TextEditingController();
  TextEditingController  emailcontroller= TextEditingController();


  void messedshow(){
    showDialog(context: context, builder:(ctx)=>AlertDialog(
      title: Text('signup'),
      content: Text('msg'),
      actions: <Widget>[
        FloatingActionButton(onPressed: (){
          Navigator.pop(context);
        },child: Text('ok'),),

      ],
    ));
  }

  @override
  void dispose() {
    passwordcontroller.dispose();
    emailcontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final provider= Provider.of<providerdata>(context);
    return Scaffold(
        body:SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
              children:[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 400,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(194, 178, 128, 1.0),
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft:  Radius.circular(20))
                      ),
                      child: Image.asset('images/baloonguy-removebg-preview.png',)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(text: TextSpan(
                      text: "Sign In \n",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.black)
                      ,children:[
                    WidgetSpan(child: SizedBox(height: 30,)),
                    TextSpan(
                        text:'Enter details to setup your accont back',style:  TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.grey)

                    )
                  ]
                  ),),
                ),


                Form(
                  key:formkey,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(21.0),
                      child: Container(
                        height: 400,
                        width: 400,
                        decoration: BoxDecoration(color: Colors.black.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child:Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextFormField(
                                controller: Username,
                                decoration:InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black,width: 1.5),
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    hintText:'Username',
                                    suffixIcon: Icon(Icons.mail)
                                ),
                                onChanged: (value){
                                  provider.updateUserInput(value);
                                },
                                validator: (value){
                                  if( value!=null && value.isEmpty){
                                    return 'enter you username';
                                  }
                                  return null;
                                },),

                              SizedBox(height: 20,),
                              TextFormField(
                                controller: emailcontroller,
                                decoration:InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black,width: 1.5),
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    hintText:'Email ID',
                                    suffixIcon: Icon(Icons.mail)
                                ),
                                validator:(value){
                      if(value!=null && value.isEmpty){
                      return 'enter the email';
                      }
                      return null;

                      },),
                              SizedBox(height: 20,),
                              TextFormField(
                                controller: passwordcontroller,
                                decoration:InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black,width: 1.5),
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    hintText:'password',
                                    suffixIcon: Icon(Icons.remove_red_eye)
                                ),
                              validator:(value){
                                  if(value!=null && value.isEmpty){
                                    return 'enter the password';
                                  }
                                  return null;

                              },)
                              ,

                              SizedBox(height: 20,),


                              GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder:(context)=>LoginScreen() ));
                                },
                                child: RichText(text: const TextSpan(
                                    text: 'Forgot Password? ',children:[

                                  WidgetSpan(child: SizedBox(width: 100,)),
                                  TextSpan(
                                      text: 'Login',style: TextStyle(color:Colors.red)
                                      ,children:[

                                  ]
                                  )

                                ]
                                    ,style:TextStyle(color: Colors.black)
                                ),
                                ),
                              ),
                                  SizedBox(height: 20,),


                              GestureDetector(
                                onTap: ()async {
                                  if (!formkey.currentState!.validate()) {
                                    return; // If validation fails, exit early
                                  }

                                  formkey.currentState!.save(); // Save the form state

                                  try {
                                    await Provider.of<providerdata>(context, listen: false)
                                        .Signup(emailcontroller.text, passwordcontroller.text);


                                    print('Sign-in successful!');
                                    // Navigate to the home screen
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(builder: (context) =>  LoginScreen()), // Make sure to replace with your home screen
                                    );
                                  } catch (e) {
                                    print('Error: $e');
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 300,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                          Colors.black,
                                          Colors.pink
                                        ])
                                        ,borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Center(child: Text("Sign In",style:TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)),),
                                ),
                              )



                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

              ]
          ),
        )

    );
  }

}
