import 'package:doctorly/core/constants/app_images.dart';

class IntroductionContent {
  String image;
  String title;
  String description;

  IntroductionContent(
      {required this.image, required this.title, required this.description});
}

List<IntroductionContent> contents = [
  IntroductionContent(
      title: "Onlayn konsultatsiya",
      description:
          "Lorem Ipsum is simply dummy text of the \nprinting and typesetting industry. Lorem \nIpsum has been the industry's standard ",
      image: AppImages.onboarding1),
  IntroductionContent(
      title: "Doktorlarni uyga chaqirish",
      description:
      "Lorem Ipsum is simply dummy text of the \nprinting and typesetting industry. Lorem \nIpsum has been the industry's standard ",
      image: AppImages.onboarding2),
  IntroductionContent(
      title: "Xususiy klinikalar ro’yxati",
      description:
      "Lorem Ipsum is simply dummy text of the \nprinting and typesetting industry. Lorem \nIpsum has been the industry's standard ",
      image: AppImages.onboarding3),
  // IntroductionContent(
  //     title: 'Onlayn Ariza topshirish',
  //     description: AppText.onboardText2,
  //     image: AppImages.onBoard2),
  // IntroductionContent(
  //     title: "Retsept tashkilotchisi",
  //     description: AppText.onboardText3,
  //     image: AppImages.onBoard3),
  // IntroductionContent(
  //     title: "24/7 Xizmat ko’rsatish",
  //     description: AppText.onboardText4,
  //     image: AppImages.onBoard4),
];
