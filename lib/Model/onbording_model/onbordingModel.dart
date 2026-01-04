class OnboardingItem {
  final String title, description, image;
  OnboardingItem({required this.title, required this.description, required this.image});
}

List<OnboardingItem> onboardingPages = [
  OnboardingItem(
    title: "Smarter Learning\nStarts Here",
    description: "Personalized lessons that adapt to your pace and goals.",
    image: "assets/onbordingfirst.png",
  ),
  OnboardingItem(
    title: "Learn. Practice.\nSucceed.",
    description: "Structured content, mock tests, and progress tracking in one place.",
    image: "assets/onbordingsecond.png",
  ),
];