// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:jan_2024_studio/countrollers/test_state.dart';
// import 'package:jan_2024_studio/data/repository/test_page_repository.dart';
// import 'package:jan_2024_studio/models/test_page_model.dart';
//
// class TestCubit extends Cubit<TestState>{
//   TestCubit(this.testPageRepo):super(TestInitialState());
//
//   final TestPageRepo testPageRepo;
//
//   Future<void> getData()async{
//     emit(TestLoadingState());
//     try{
//     List<TestPageModel> testPageModel = await testPageRepo.getUserInformation();
//     emit(TestSuccessState(testPageModel));
//     }
//         catch(error){
//       emit(TestErrorState(error.toString()));
//         }
//   }
//
// }