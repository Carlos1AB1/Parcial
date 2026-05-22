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
