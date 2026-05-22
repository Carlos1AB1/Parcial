const { Producto } = require('../src/producto');

test('Calcular precio final sin descuento, IVA 19% (CP06)', () => {
    const p = new Producto("Libro", 100);
    expect(p.calcularPrecioFinal()).toBe(119);
});

test('Calcular precio final con descuento (CP07)', () => {
    const p = new Producto("Libro", 100);
    p.aplicarDescuento(20);
    expect(p.calcularPrecioFinal()).toBe(95.2);
});
