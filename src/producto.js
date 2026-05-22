class Producto {
    constructor(nombre, precioBase) {
        if (precioBase <= 0) {
            throw new Error("El precio base debe ser mayor que cero");
        }
        this.nombre = nombre;
        this.precioBase = precioBase;
        this.descuento = 0;
    }
}
module.exports = { Producto };
