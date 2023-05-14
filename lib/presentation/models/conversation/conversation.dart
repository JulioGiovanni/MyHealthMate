import 'participant1.dart';
import 'participant2.dart';

class Conversation {
	int? id;
	DateTime? createdAt;
	Participant1? participant1;
	Participant2? participant2;

	Conversation({
		this.id, 
		this.createdAt, 
		this.participant1, 
		this.participant2, 
	});

	factory Conversation.fromJson(Map<String, dynamic> json) => Conversation(
				id: json['id'] as int?,
				createdAt: json['createdAt'] == null
						? null
						: DateTime.parse(json['createdAt'] as String),
				participant1: json['participant1'] == null
						? null
						: Participant1.fromJson(json['participant1'] as Map<String, dynamic>),
				participant2: json['participant2'] == null
						? null
						: Participant2.fromJson(json['participant2'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'createdAt': createdAt?.toIso8601String(),
				'participant1': participant1?.toJson(),
				'participant2': participant2?.toJson(),
			};
}
