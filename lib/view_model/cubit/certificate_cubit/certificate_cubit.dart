import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'certificate_state.dart';

class CertificateCubit extends Cubit<CertificateState> {
  CertificateCubit(): super(CertificateInitState());

  static CertificateCubit get(context)=>BlocProvider.of<CertificateCubit>(context);

TextEditingController amountController = TextEditingController();
TextEditingController interestController = TextEditingController();
TextEditingController periodController = TextEditingController();

double monthInterest=0;
double totalAmount=0;

void calculateAmount()
{
  monthInterest= double.parse(amountController.text) * double.parse(interestController.text) / 100;
  monthInterest/=12;

  totalAmount=monthInterest*double.parse(periodController.text);
  emit(CertificateCalculateAmount());

}


}