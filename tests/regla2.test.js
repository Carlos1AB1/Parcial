const { Producto } = require('../src/producto');

test('Descuento maximo del 40% es permitido (CP04)', () => {
    const p = new Producto("Libro", 100);
    p.aplicarDescuento(40);
    expect(p.descuento).toBe(40);
});

test('Descuento del 41% es rechazado (CP05)', () => {
    const p = new Producto("Libro", 100);
    expect(() => p.aplicarDescuento(41)).toThrow("El descuento debe estar entre 0 y 40%");
});

test('Descuento negativo es rechazado (CP08)', () => {
    const p = new Producto("Libro", 100);
    expect(() => p.aplicarDescuento(-1)).toThrow("El descuento debe estar entre 0 y 40%");
});
