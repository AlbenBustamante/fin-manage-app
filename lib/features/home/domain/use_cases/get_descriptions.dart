import 'package:finmanageapp/core/use_case/use_case.dart';
import 'package:finmanageapp/features/home/data/models/description_model.dart';
import 'package:finmanageapp/features/home/domain/repositories/description_repository.dart';

class GetDescriptions extends UseCase<List<DescriptionModel>, void> {
  final DescriptionRepository _repository;

  GetDescriptions(this._repository);

  @override
  Future<List<DescriptionModel>> call({required void params}) {
    return _repository.fetchAll();
  }
}
