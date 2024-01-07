import 'package:certificate_app/core/utils/colors.dart';
import 'package:certificate_app/view_model/cubit/certificate_cubit/certificate_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/cubit/certificate_cubit/certificate_state.dart';

class CertificateHome extends StatelessWidget {
  const CertificateHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.blue,
        leading: Icon(Icons.menu_outlined,color: AppColor.white,size: 20,),
        actions: [
          Icon(Icons.help_outline,color: AppColor.white,size: 20,),
          SizedBox(width: 20,),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.blue,
              borderRadius: BorderRadiusDirectional.only(bottomEnd: Radius.circular(100)),
            ),
            child: Center(
              child: Text("Fixed Deposite\n   Calculator",style: TextStyle(
                color: AppColor.white,
                fontSize: 32,
                fontWeight: FontWeight.w300,
              ),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: BlocConsumer<CertificateCubit,CertificateState>(
              listener: (context, state) {

              },
              builder: (context, state) {
                var cubit = CertificateCubit.get(context);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    Text("Deposite Amount    :",style: TextStyle(
                      color: AppColor.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),),

                    SizedBox(
                      height: 45,
                      child: TextFormField(

                        controller: cubit.amountController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 14),

                        decoration: InputDecoration(
                            fillColor: AppColor.white,
                            filled: true,
                            hintText: "eg.10000",

                            border:  OutlineInputBorder(

                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: AppColor.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: AppColor.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: AppColor.white),

                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("Annual Interest Rate(%)  :",style: TextStyle(
                      color: AppColor.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),),

                    SizedBox(
                      height: 45,
                      child: TextFormField(

                        controller: cubit.interestController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 14),

                        decoration: InputDecoration(
                            fillColor: AppColor.white,
                            filled: true,
                            hintText: "eg. 11.5",

                            border:  OutlineInputBorder(

                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: AppColor.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: AppColor.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: AppColor.white),

                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("Period (in month) :",style: TextStyle(
                      color: AppColor.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),),
                    SizedBox(
                      height: 45,
                      child: TextFormField(

                        controller: cubit.periodController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 14),

                        decoration: InputDecoration(
                            fillColor: AppColor.white,
                            filled: true,
                            hintText: "eg. 6",

                            border:  OutlineInputBorder(

                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: AppColor.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: AppColor.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: AppColor.white),

                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),


                    //Elevated Button
                    SizedBox(
                      width: double.infinity,

                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(double.infinity, 60),
                          backgroundColor: AppColor.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        onPressed: (){
                          cubit.calculateAmount();
                          showModalBottomSheet(context: context,
                            builder: (context) {
                              return SizedBox(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text("Result :",style: TextStyle(
                                        color: AppColor.pink,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),),
                                      Center(
                                        child: Text("Interest in month : ${cubit.monthInterest.toStringAsFixed(2)}",style: TextStyle(
                                          color: AppColor.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),),
                                      ),
                                      Center(
                                        child: Text("Total Interest    : ${cubit.totalAmount.toStringAsFixed(2)}",style: TextStyle(
                                          color: AppColor.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),),
                                      ),
                                      SizedBox(height: 50,),
                                    ],
                                  ),
                                ),
                              );
                            },);
                        },
                        child: Text("calculate".toUpperCase(),style: TextStyle(
                          color: AppColor.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),),),
                    ),


                  ],
                );
              },
            )
          ),

          
        ],
      ),

    );
  }
}
