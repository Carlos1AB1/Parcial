class Producto {
    constructor(nombre, precioBase) {
        if (precioBase <= 0) {
            throw new Error("El precio base debe ser mayor que cero");
        }
        this.nombre = nombre;
        this.precioBase = precioBase;
        this.descuento = 0;
    }

    aplicarDescuento(porcentaje) {
        if (porcentaje < 0 || porcentaje > 40) {
            throw new Error("El descuento debe estar entre 0 y 40%");
        }
        this.descuento = porcentaje;
    }
}
module.exports = { Producto };
