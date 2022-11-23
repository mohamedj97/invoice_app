import 'package:bloc/bloc.dart';

class FormSubmitCubit extends Cubit<bool> {
  FormSubmitCubit() : super(false);
  void isSubmitField({required bool isSubmit}) {
    emit(isSubmit);
  }

  // void unSubmitField() {
  //   emit(FormSubmitInitial());
  // }
}
