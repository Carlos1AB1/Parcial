# Librería del Centro - Calculadora de Precios

## Parte 1 - Análisis

### Reglas 1 y 2: Particiones de Equivalencia

| Partición | Condición | Valor Representativo | Resultado Esperado |
|-----------|-----------|----------------------|--------------------|
| Válida (Regla 1) | Precio base > 0 | 50000 | Producto creado |
| Inválida (Regla 1) | Precio base = 0 | 0 | Error: Rechazado |
| Inválida (Regla 1) | Precio base < 0 | -15000 | Error: Rechazado |
| Válida (Regla 2) | Descuento entre 0 y 40 | 15% | Descuento aplicado |
| Inválida (Regla 2) | Descuento < 0 | -5% | Error: Rechazado |
| Inválida (Regla 2) | Descuento > 40 | 50% | Error: Rechazado |

### Regla 2: Análisis de Valores Límite (Rango 0% - 40%)

| Límite | Valor a probar | Resultado Esperado |
|--------|----------------|--------------------|
| Inferior Inválido | -1% | Error: Rechazado |
| Inferior Válido | 0% | Válido, 0% aplicado |
| Superior Válido | 40% | Válido, 40% aplicado |
| Superior Inválido | 41% | Error: Rechazado |

### Regla 3: Pregunta al Administrador
**Pregunta:** Si al aplicar el descuento y luego el IVA, el precio resulta con decimales (ej. 13450.35), ¿debemos redondear al entero más cercano, truncarlos, o manejar una cantidad exacta de decimales de registro?
**Justificación:** El tratamiento descuidado de decimales en valores monetarios genera descuadres financieros irreparables en reportes.

---

## Parte 2 - Casos de Prueba

| ID | Regla | Descripción | Precondición | Datos de entrada | Pasos | Resultado esperado | Tipo |
|----|-------|-------------|--------------|------------------|-------|--------------------|------|
| CP01 | R1 | Crear producto normal | Ninguna | Precio base=1000 | Crear producto con precio base | Objeto creado con precio base 1000 | Positivo |
| CP02 | R1 | Crear producto precio cero | Ninguna | Precio base=0 | Crear producto con precio base | Rechazado (Mensaje de error) | Borde |
| CP03 | R1 | Crear producto negativo | Ninguna | Precio base=-50 | Crear producto con precio base | Rechazado (Mensaje de error) | Negativo |
| CP04 | R2 | Descuento máximo permitido | Producto creado (100) | Dcto=40% | Aplicar descuento al producto | Descuento 40% registrado ok | Borde |
| CP05 | R2 | Descuento superior límite | Producto creado (100) | Dcto=41% | Aplicar descuento al producto | Rechazado (Mensaje de error) | Negativo |
| CP06 | R3 | Cálculo sin descuento | Producto creado (100), Dcto=0% | - | Calcular precio final | Final = 119 (100 + 19% IVA) | Positivo |
| CP07 | R3 | Cálculo con descuento | Producto creado(100), Dcto=20%| - | Calcular precio final | Final = 95.2 (80 + 19% IVA) | Positivo |
| CP08 | R2 | Descuento inferior límite | Producto creado (100) | Dcto=-1% | Aplicar descuento al producto | Rechazado (Mensaje de error) | Negativo |

---

## Ejecución de Tests

### ✅ Tests Unitarios (Jest)
```bash
npm run test
```

**Resultado:** 8 tests pasados con cobertura 100%

```text
Test Suites: 3 passed, 3 total
Tests:       8 passed, 8 total

File         | % Stmts | % Branch | % Funcs | % Lines 
-------------|---------|----------|---------|----------
All files    |     100 |      100 |     100 |     100
 producto.js |     100 |      100 |     100 |     100
```

### ✅ Tests BDD (Cucumber)
```bash
npm run bdd
```

**Resultado:** 5 escenarios pasados, 15 steps completados

```text
5 scenarios (5 passed)
15 steps (15 passed)
0m00.006s
```

**📄 Ver documentación completa en:** [docs/EJECUCION_TESTS.md](docs/EJECUCION_TESTS.md)

**📸 Evidencias de ejecución:**
- [test-unitarios-output.txt](docs/screenshots/test-unitarios-output.txt)
- [test-bdd-output.txt](docs/screenshots/test-bdd-output.txt)
