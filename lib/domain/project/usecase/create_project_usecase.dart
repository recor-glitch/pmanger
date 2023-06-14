import 'package:either_dart/either.dart';
import 'package:pmanager/data/project/dto/create_project_dto_dart';
import 'package:pmanager/domain/project/entity/ProjectEntity.dart';
import 'package:pmanager/domain/project/repository/create_project_repository.dart';

class CreateProjectUsecase {
  final CreateProductRepository createProductRepository;

  CreateProjectUsecase(this.createProductRepository);

  Future<Either<ProjectEntity, Exception>> invoke(CreateProjectDto dto) {
    return createProductRepository.createProduct(dto);
  }
}
