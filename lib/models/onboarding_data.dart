class OnboardingData {
  final String title;
  final String description;
  final String imageSrc;

  OnboardingData({
    this.title = '',
    this.description = '',
    this.imageSrc = '',
  });
}

List<OnboardingData> onboardingData = [

  OnboardingData(
    title: 'Finance app the safest and most trusted',
    description:
        'Your finance work starts here. We are here to help you track and deal with speeding up your transactions.',
    imageSrc: 'assets/onboardingOne.png',
  ),
  OnboardingData(
    title: 'The fastest transaction process only here.',
    description:
        "Get easy to pay all your bills with just a few steps. Paying your bills become fast and efficient.",
    imageSrc: 'assets/onboardingTwo.png',
  ),

];
