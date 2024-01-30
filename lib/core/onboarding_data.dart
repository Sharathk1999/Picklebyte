// ignore_for_file: public_member_api_docs, sort_constructors_first
class OnboardingContent {
  String title;
  String description;
  String img;
  OnboardingContent({
    required this.title,
    required this.description,
    required this.img,
  });
}

List<OnboardingContent> contents = [
  OnboardingContent(
    title: "Select from our Best Menu",
    description: "Pick your food from our menu, More than 20 times",
    img: "assets/images/screen1.png",
  ),
  OnboardingContent(
    title: "Easy COD and Online Payment",
    description: "Your can pay as COD and Card payment is available",
    img: "assets/images/screen2.png",
  ),
  OnboardingContent(
    title: "Quick Delivery at your Doorstep",
    description: "Deliver your food at your Doorstep",
    img: "assets/images/screen3.png",
  ),
];
