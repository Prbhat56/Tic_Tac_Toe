import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketClient {
  IO.Socket? socket;
  static SocketClient? _instance;

  SocketClient._internal() {
    socket = IO.io('http://localhost:3000', <String, dynamic>{
      'transports': ['websocket'],
    });
    socket!.onConnect((_) {
      print('Connected to Socket.IO server');
      socket!.emit('client-event', 'Hello, server!');
    });

    socket!.on('server-event', (data) {
      print('Received data from server: $data');
    });

    socket!.onDisconnect((_) {
      print('Disconnected from Socket.IO server');
    });

    // socket = IO.io('http://10.12.1.217:3000', <String, dynamic>{
    //   'transports': ['websocket'],
    //   'autoConnect': false,
    // });
    // socket!.on('connect', (_) {
    //   print('Connected to server');

    //   socket!.emit('createRoom', {'nickname': 'yourNickname'});
    // });
    // socket!.on('connect_error', (data) {
    //   print('Connection error: $data');
    // });

    socket!.connect();
  }

  static SocketClient get instance {
    _instance ??= SocketClient._internal();
    return _instance!;
  }
}
