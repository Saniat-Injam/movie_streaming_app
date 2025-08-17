import 'package:get/get.dart';
import 'package:movie_streaming_app/features/movie_details/models/subscription_plan_model.dart';

class SubscriptionController extends GetxController {
  var selectedPlan = Rxn<SubscriptionPlan>();

  final plans = <SubscriptionPlan>[
    SubscriptionPlan(
      title: "Annually",
      price: "\$79.99 / year",
      billingInfo: "Billed annually with 14-day trial",
      isPopular: true,
    ),
    SubscriptionPlan(
      title: "Monthly",
      price: "\$7.99 / monthly",
      billingInfo: "Billed monthly",
    ),
  ];
}
