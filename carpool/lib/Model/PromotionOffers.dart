class PromotionOffer {
  final String id; // Unique identifier for the promotion offer
  final String title; // Title of the offer
  final String description; // Description of the offer
  final DateTime startDate; // Start date of the offer
  final DateTime endDate; // End date of the offer
  final double discount; // Discount percentage or amount
  final String imageUrl; // URL or path to the offer image

  PromotionOffer({
    required this.id,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.discount,
    required this.imageUrl,
  });

  factory PromotionOffer.fromJson(Map<String, dynamic> json) {
    return PromotionOffer(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      discount: json['discount'].toDouble(),
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'discount': discount,
      'imageUrl': imageUrl,
    };
  }
}
