class Transactiones {
  int? id; // ID de la transacción (clave principal)
  String importe;
  String plataforma;
  String fecha;

  Transactiones({
    this.id,
    required this.importe,
    required this.plataforma,
    required this.fecha,
  });

  // Método para convertir un mapa a un objeto Transactiones
  factory Transactiones.fromMap(Map<String, dynamic> map) {
    return Transactiones(
      id: map['id'],
      importe: map['importe'],
      plataforma: map['plataforma'],
      fecha: map['fecha'],
    );
  }

  // Método para convertir un objeto Transactiones a un mapa
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'importe': importe,
      'plataforma': plataforma,
      'fecha': fecha,
    };
  }
}
