import 'package:dartz/dartz.dart';
import 'package:houseplants/core/errors/exception.dart';
import 'package:houseplants/core/errors/failure.dart';
import 'package:houseplants/features/deep_link/data/data_source/data_source.dart';
import 'package:houseplants/features/deep_link/domain/repositoy.dart/deep_link_repository.dart';

class DeepLinkRepoImp implements DeepLinkRepository {
  final DeepLinkDataSource dataSource;

  DeepLinkRepoImp({required this.dataSource});
  @override
  Future<Either<Failure, int>> extractIdFromLink() async {
    try {
      final productId = await dataSource.initDeepLinks();

      if (productId != null) {
        return right(productId);
      } else {
        return left(const Failure('Product Id not found'));
      }
    } on ServerException catch (e) {
      throw left(e.toString());
    }
  }
}
