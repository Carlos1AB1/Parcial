const { Producto } = require('../src/producto');

test('Crear producto normal (CP01)', () => {
    const p = new Producto("Libro", 1000);
    expect(p.precioBase).toBe(1000);
});

test('Crear producto con precio 0 debe lanzar error (CP02)', () => {
    expect(() => new Producto("Libro", 0)).toThrow("El precio base debe ser mayor que cero");
});

test('Crear producto con precio negativo debe lanzar error (CP03)', () => {
    expect(() => new Producto("Libro", -50)).toThrow("El precio base debe ser mayor que cero");
});
