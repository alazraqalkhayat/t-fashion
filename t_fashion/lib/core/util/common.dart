import 'package:dartz/dartz.dart';

import 'package:shared_preferences/shared_preferences.dart';
/*

Either<CustomerModel,bool> checkCustomerLoggedIn() {
  try {
    final user = LocalDataProvider(sharedPreferences: sl<SharedPreferences>()).getCachedData(
      key:'CUSTOMER_USER',
      retrievedDataType: CustomerModel.init(),
      returnType: List<CustomerModel>
    );
    if (user != null) {
      return Left(user);
    }
    return Right(false);
  } catch (e) {
    print("checkLoggedIn catch");
    return Right(false);
  }
}

*/
