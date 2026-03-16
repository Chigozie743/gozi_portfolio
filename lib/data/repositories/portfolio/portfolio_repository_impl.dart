import 'package:gozie_williams_portfolio/data/repositories/portfolio/portfolio_repository_abstract.dart';
import 'package:gozie_williams_portfolio/data/sources/local/portfolio_source.dart';
import 'package:gozie_williams_portfolio/models/profile/profile_model.dart';
import 'package:gozie_williams_portfolio/models/project/project_model.dart';

class PortfolioRepositoryImpl implements PortfolioRepositoryAbstract {
  PortfolioRepositoryImpl(this._source);

  final PortfolioSource _source;

  @override
  ProfileModel getProfile() => _source.fetchProfile();

  @override
  List<ProjectModel> getProjects() => _source.fetchProjects();
}
