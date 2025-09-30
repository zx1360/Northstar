import 'dart:io';

Future<String> getLocalIps() async {
  List<String> ips = [];
  for (var interface in await NetworkInterface.list()) {
    for (var addr in interface.addresses) {
      if (addr.type == InternetAddressType.IPv4 && !addr.isLoopback) {
        // TODO: 临时写法, 识别出校园网内的局域网ip.
        if(addr.address.startsWith("10.61")) {
          ips.add(addr.address);
        }
      }
    }
  }
  if(ips.isNotEmpty) {
    return ips[0];
  } else {
    return "";
  }
}
