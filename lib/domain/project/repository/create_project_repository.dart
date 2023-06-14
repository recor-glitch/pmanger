import 'package:either_dart/either.dart';
import 'package:pmanager/data/project/dto/create_project_dto_dart';
import 'package:pmanager/domain/project/entity/ProjectEntity.dart';

abstract class CreateProductRepository {
  Future<Either<ProjectEntity, Exception>> createProduct(CreateProjectDto dto);
}
