import 'package:flutter/cupertino.dart';
import 'package:sunbird_flutter_client_services/core.dart';

class _BuildConfig {
  static const BASE_URL =
      const String.fromEnvironment("base_url", defaultValue: "");
}

init(BuildContext context) async {
  await CsModule().init(
    CsConfig(
      core: CsCoreConfig(
          api: CsCoreApiConfig(
            host: _BuildConfig.BASE_URL,
            authentication: CsCoreApiAuthenticationConfig(
              bearerToken: String.fromEnvironment("BEARER", defaultValue: ""),
            ),
          ),
          global: CsCoreGlobalConfig()),
      services: CsServicesConfig(
        frameworkServiceConfig: CsFrameworkServiceConfig(
          channelApiPath: '/api/channel/v1',
          frameworkApiPath: '/api/framework/v1',
        ),
      ),
    ),
  );
}
