import '../error/failure.dart';
import 'multiple_result.dart';
/*
* a base useCase class that has only one method for executing
*
*   Type -> Indicate to the Response data type
*    Params -> Indicate  to which Parameters you want to pass to your method
*
* !*/

abstract class BaseUseCase<Type, Params> {
  Future<Result<Failure, Type>> call(Params params);
}

abstract class BaseUseCaseWithoutFailure<Type, Params> {
  Future<Type> call(Params params);
}
