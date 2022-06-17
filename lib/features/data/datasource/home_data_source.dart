import 'package:ptolemay_test_project/features/data/model/movie_model.dart';

abstract class HomeDataSource {
  Future<MovieModel> getPopular();
}
