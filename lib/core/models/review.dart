class Review {
  final String author;
  final int rating;
  final String comment;

  Review({
    required this.author,
    required this.rating,
    required this.comment,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      author: json['author'] as String,
      rating: json['rating'] as int,
      comment: json['comment'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'rating': rating,
      'comment': comment,
    };
  }
}
