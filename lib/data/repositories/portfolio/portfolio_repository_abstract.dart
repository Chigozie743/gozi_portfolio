import 'package:gozie_williams_portfolio/models/profile/profile_model.dart';
import 'package:gozie_williams_portfolio/models/project/project_model.dart';

abstract class PortfolioRepositoryAbstract {
  ProfileModel getProfile();
  List<ProjectModel> getProjects();
}
