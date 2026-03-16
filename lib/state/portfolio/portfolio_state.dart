import 'package:gozie_williams_portfolio/models/profile/profile_model.dart';
import 'package:gozie_williams_portfolio/models/project/project_model.dart';

class PortfolioState {
  const PortfolioState({
    required this.profile,
    required this.projects,
    required this.selectedFilter,
  });

  final ProfileModel profile;
  final List<ProjectModel> projects;
  final String selectedFilter;

  List<ProjectModel> get filteredProjects {
    if (selectedFilter == 'All') {
      return projects;
    }
    return projects.where((project) => project.platform == selectedFilter).toList();
  }

  PortfolioState copyWith({
    ProfileModel? profile,
    List<ProjectModel>? projects,
    String? selectedFilter,
  }) {
    return PortfolioState(
      profile: profile ?? this.profile,
      projects: projects ?? this.projects,
      selectedFilter: selectedFilter ?? this.selectedFilter,
    );
  }
}
