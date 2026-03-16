class ProjectModel {
  const ProjectModel({
    required this.name,
    required this.summary,
    required this.platform,
    required this.androidUrl,
    this.iosUrl,
    this.imageAsset,
  });

  final String name;
  final String summary;
  final String platform;
  final String androidUrl;
  final String? iosUrl;
  final String? imageAsset;
}
