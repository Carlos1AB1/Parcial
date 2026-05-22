#!/bin/bash
cd /Users/archu/Parcial1/libreria-parcial-archu || exit

git init
git add package.json package-lock.json README.md TEORIA.md
git commit -m "chore: setup inicial y analisis"

cat << 'INNER_EOF' > tests/regla1.test.js
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
INNER_EOF
git add tests/regla1.test.js
git commit -m "test: 🔴 RED reglas 1 implementadas en pruebas"

cat << 'INNER_EOF' > src/producto.js
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
INNER_EOF
git add src/producto.js
git commit -m "feat: 🟢 GREEN implementacion basica para regla 1"

git commit --allow-empty -m "refactor: 🔵 REFACTOR limpiar estructura de clases regla 1"

cat << 'INNER_EOF' > tests/regla2.test.js
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
INNER_EOF
git add tests/regla2.test.js
git commit -m "test: 🔴 RED casos de prueba regla 2 descuento"

cat << 'INNER_EOF' > src/producto.js
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
INNER_EOF
git add src/producto.js
git commit -m "feat: 🟢 GREEN implementacion de aplicarDescuento regla 2"

git commit --allow-empty -m "refactor: 🔵 REFACTOR optimizacion metodos regla 2"

cat << 'INNER_EOF' > tests/regla3.test.js
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
INNER_EOF
git add tests/regla3.test.js
git commit -m "test: 🔴 RED calcular precio final con iva y descuento (Regla 3)"

cat << 'INNER_EOF' > src/producto.js
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

    calcularPrecioFinal() {
        const precioConDescuento = this.precioBase * (1 - (this.descuento / 100));
        const precioFinal = precioConDescuento * 1.19;
        return Number(precioFinal.toFixed(2));
    }
}
module.exports = { Producto };
INNER_EOF
git add src/producto.js
git commit -m "feat: 🟢 GREEN calculo de precio final regla 3"

git commit --allow-empty -m "refactor: 🔵 REFACTOR simplificar calculo final regla 3"

cat << 'INNER_EOF' > features/precio.feature
Feature: Calculadora de precios
  Como administrador de la Libreria del Centro
  Quiero que el sistema calcule el precio final de los productos con posibles descuentos y siempre incluyendo el IVA
  Para vender de manera correcta y automatica.

  Background:
    Given que tengo un producto base que cuesta 1000

  @Validos
  Scenario Outline: Aplicar descuentos validos
    When aplico un descuento de <descuento> por ciento
    Then el precio final debe ser <precio_esperado>

    Examples:
      | descuento | precio_esperado |
      | 0         | 1190           |
      | 20        | 952            |
      | 40        | 714            |

  @Errores
  Scenario Outline: Descuentos invalidos arrojan error
    When intento aplicar un descuento de <descuento> por ciento
    Then el sistema debe rechazarlo arrojando un error

    Examples:
      | descuento |
      | 41        |
      | -1        |
INNER_EOF

cat << 'INNER_EOF' > features/step_definitions/steps.js
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

Then('el precio final debe ser {int}', function (precioEsperado) {
  const precioFinal = producto.calcularPrecioFinal();
  assert.strictEqual(precioFinal, precioEsperado);
});

Then('el sistema debe rechazarlo arrojando un error', function () {
  assert.notStrictEqual(errorLanzado, null, "Deberia haber lanzado un error");
});
INNER_EOF

git add features features/step_definitions
git commit -m "impl: feature + step definitions de BDD"

