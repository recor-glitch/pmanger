import 'package:either_dart/either.dart';
import 'package:pmanager/data/project/api/ProjectApi.dart';
import 'package:pmanager/data/project/dto/create_project_dto_dart';
import 'package:pmanager/domain/project/entity/ProjectEntity.dart';
import 'package:pmanager/domain/project/repository/create_project_repository.dart';

class ProjectRepositoryImpl implements CreateProductRepository {
  final ProjectApi projectApi;

  ProjectRepositoryImpl(this.projectApi);
  @override
  Future<Either<ProjectEntity, Exception>> createProduct(
      CreateProjectDto dto) async {
    try {
      var product = await projectApi.createProject(dto);
      return Left(product);
    } on Exception catch (e) {
      return Right(Exception(e));
    }
  }
}
