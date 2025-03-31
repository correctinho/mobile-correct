import 'dart:convert';

class UserBenefitsModel {
  String benefitsName;
  String imgBenefits;
  int balence;
  String status;
  String? blockedAt;
  String? cancelledAt;
  String? cancellingRequestAt;
  String? blockReason;
  String? cancelReason;
  String? gracePeriodEndDate;
  Provider provider;

  UserBenefitsModel(
      {required this.benefitsName,
      required this.imgBenefits,
      required this.balence,
      required this.status,
      required this.blockedAt,
      required this.cancelledAt,
      required this.cancellingRequestAt,
      required this.blockReason,
      required this.cancelReason,
      required this.gracePeriodEndDate,
      required this.provider});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'benefitsName': benefitsName,
      'imgBenefits': imgBenefits,
      'balence': balence,
      'status': status,
      'blockedAt': blockedAt,
      'cancelledAt': cancelledAt,
      'cancellingRequestAt': cancellingRequestAt,
      'blockReason': blockReason,
      'cancelReason': cancelReason,
      'gracePeriodEndDate': gracePeriodEndDate,
      'provider': provider.toMap(),
    };
  }

  factory UserBenefitsModel.fromJson(Map<String, dynamic> json) {
    return UserBenefitsModel(
      benefitsName: json['item_name'] ?? '',
      imgBenefits: json['img_url'] ?? '',
      balence: json['balance'] ?? '',
      status: json['status'],
      blockedAt: json['blocked_at'],
      cancelledAt: json['cancelled_at'],
      cancellingRequestAt: json['cancelling_request_at'],
      blockReason: json[' block_reason'],
      cancelReason: json['cancel_reason'],
      gracePeriodEndDate: json['grace_period_end_date'],
      provider: Provider.fromJson(json['Provider']),
    );
  }

  String toJson() => json.encode(toMap());
}

class Provider {
  String businessName;

  Provider({required this.businessName});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fantasy_name': businessName,
    };
  }

  factory Provider.fromJson(Map<String, dynamic> json) {
    return Provider(businessName: json['fantasy_name']);
  }
}
