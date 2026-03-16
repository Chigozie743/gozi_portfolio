class ProfileModel {
  const ProfileModel({
    required this.name,
    required this.role,
    required this.bio,
    required this.githubUrl,
    required this.linkedinUrl,
  });

  final String name;
  final String role;
  final String bio;
  final String githubUrl;
  final String linkedinUrl;
}
