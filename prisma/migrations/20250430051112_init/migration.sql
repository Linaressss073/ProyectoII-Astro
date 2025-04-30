-- CreateTable
CREATE TABLE "Usuario" (
    "id_usuario" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nombre_usuario" TEXT NOT NULL,
    "clave" TEXT NOT NULL,
    "rol" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Cliente" (
    "id_cliente" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nombre" TEXT NOT NULL,
    "documento" TEXT NOT NULL,
    "correo" TEXT NOT NULL,
    "telefono" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Cabana" (
    "id_cabana" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nombre" TEXT NOT NULL,
    "estado" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Reserva" (
    "id_reserva" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "id_cliente" INTEGER NOT NULL,
    "fecha_reserva" TEXT NOT NULL,
    "numero_adultos" INTEGER NOT NULL,
    "numero_ninos" INTEGER NOT NULL,
    "dias_hospedaje" INTEGER NOT NULL,
    "porcentaje_pagado" REAL NOT NULL,
    "medio_pago" TEXT NOT NULL,
    "estado" TEXT NOT NULL,
    CONSTRAINT "Reserva_id_cliente_fkey" FOREIGN KEY ("id_cliente") REFERENCES "Cliente" ("id_cliente") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Hospedaje" (
    "id_hospedaje" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "id_reserva" INTEGER NOT NULL,
    "id_cabana" INTEGER NOT NULL,
    "fecha_inicio" TEXT NOT NULL,
    "fecha_fin" TEXT NOT NULL,
    "estado" TEXT NOT NULL,
    CONSTRAINT "Hospedaje_id_reserva_fkey" FOREIGN KEY ("id_reserva") REFERENCES "Reserva" ("id_reserva") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Hospedaje_id_cabana_fkey" FOREIGN KEY ("id_cabana") REFERENCES "Cabana" ("id_cabana") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Pasadia" (
    "id_pasadia" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "id_cliente" INTEGER NOT NULL,
    "fecha" TEXT NOT NULL,
    "incluye_almuerzo" BOOLEAN NOT NULL,
    CONSTRAINT "Pasadia_id_cliente_fkey" FOREIGN KEY ("id_cliente") REFERENCES "Cliente" ("id_cliente") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Servicio" (
    "id_servicio" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nombre" TEXT NOT NULL,
    "tipo" TEXT NOT NULL,
    "precio" REAL NOT NULL
);

-- CreateTable
CREATE TABLE "Pedido" (
    "id_pedido" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "id_cliente" INTEGER NOT NULL,
    "id_usuario" INTEGER NOT NULL,
    "fecha" DATETIME NOT NULL,
    "tipo_pedido" TEXT NOT NULL,
    CONSTRAINT "Pedido_id_cliente_fkey" FOREIGN KEY ("id_cliente") REFERENCES "Cliente" ("id_cliente") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Pedido_id_usuario_fkey" FOREIGN KEY ("id_usuario") REFERENCES "Usuario" ("id_usuario") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "DetallePedido" (
    "id_detalle" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "id_pedido" INTEGER NOT NULL,
    "id_servicio" INTEGER NOT NULL,
    "cantidad" INTEGER NOT NULL,
    "subtotal" REAL NOT NULL,
    CONSTRAINT "DetallePedido_id_pedido_fkey" FOREIGN KEY ("id_pedido") REFERENCES "Pedido" ("id_pedido") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "DetallePedido_id_servicio_fkey" FOREIGN KEY ("id_servicio") REFERENCES "Servicio" ("id_servicio") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Factura" (
    "id_factura" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "id_cliente" INTEGER NOT NULL,
    "fecha" DATETIME NOT NULL,
    "total" REAL NOT NULL,
    "metodo_pago" TEXT NOT NULL,
    CONSTRAINT "Factura_id_cliente_fkey" FOREIGN KEY ("id_cliente") REFERENCES "Cliente" ("id_cliente") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Pago" (
    "id_pago" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "id_factura" INTEGER NOT NULL,
    "monto" REAL NOT NULL,
    "metodo_pago" TEXT NOT NULL,
    "fecha_pago" DATETIME NOT NULL,
    CONSTRAINT "Pago_id_factura_fkey" FOREIGN KEY ("id_factura") REFERENCES "Factura" ("id_factura") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Evento" (
    "id_evento" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nombre" TEXT NOT NULL,
    "tipo" TEXT NOT NULL,
    "fecha_inicio" TEXT NOT NULL,
    "fecha_fin" TEXT NOT NULL,
    "detalle" TEXT NOT NULL,
    "alquilado_por" INTEGER NOT NULL,
    CONSTRAINT "Evento_alquilado_por_fkey" FOREIGN KEY ("alquilado_por") REFERENCES "Cliente" ("id_cliente") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "Cliente_documento_key" ON "Cliente"("documento");
