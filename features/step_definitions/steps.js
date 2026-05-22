const { Given, When, Then } = require('@cucumber/cucumber');
const { Producto } = require('../../src/producto');
const assert = require('assert');

let producto;
let errorLanzado = null;

Given('que tengo un producto base que cuesta {int}', function (precioBase) {
  producto = new Producto("Producto Prueba", precioBase);
});

When('aplico un descuento de {int} por ciento', function (descuento) {
  producto.aplicarDescuento(descuento);
});

When('intento aplicar un descuento de {int} por ciento', function (descuento) {
  errorLanzado = null;
  try {
     producto.aplicarDescuento(descuento);
  } catch (e) {
     errorLanzado = e;
  }
});

Then('el precio final debe ser {float}', function (precioEsperado) {
  const precioFinal = producto.calcularPrecioFinal();
  assert.strictEqual(precioFinal, precioEsperado);
});


Then('el sistema debe rechazarlo arrojando un error', function () {
  assert.notStrictEqual(errorLanzado, null, "Deberia haber lanzado un error");
});
