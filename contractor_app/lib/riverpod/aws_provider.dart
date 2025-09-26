import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AwsCredentials {
  final String accessKey;
  final String secretKey;

  AwsCredentials({required this.accessKey, required this.secretKey});
}

final awsCredentialsProvider = Provider<AwsCredentials>((ref) {
  final accessKey = dotenv.env['AWS_ACCESS_KEY_ID']!;
  final secretKey = dotenv.env['AWS_SECRET_ACCESS_KEY']!;
  return AwsCredentials(accessKey: accessKey, secretKey: secretKey);
});
