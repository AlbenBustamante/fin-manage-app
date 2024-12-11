import 'package:finmanageapp/core/use_case/use_case.dart';
import 'package:finmanageapp/features/home/data/models/category_model.dart';
import 'package:finmanageapp/features/home/domain/repositories/category_repository.dart';

class GetCategories extends UseCase<List<CategoryModel>, void> {
  final CategoryRepository _repository;

  GetCategories(this._repository);

  @override
  Future<List<CategoryModel>> call({required void params}) {
    return _repository.fetchAll();
  }
}
