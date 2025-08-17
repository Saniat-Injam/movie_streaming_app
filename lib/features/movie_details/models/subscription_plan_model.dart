class SubscriptionPlan {
  final String title;
  final String price;
  final String billingInfo;
  final bool isPopular;

  SubscriptionPlan({
    required this.title,
    required this.price,
    required this.billingInfo,
    this.isPopular = false,
  });
}
