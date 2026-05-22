# Guía de Ejecución de Tests

## 1. Tests Unitarios (Jest)

### Comando:
```bash
npm run test
```

### Resultado Esperado:
```
> libreria-parcial-carlos-baron@1.0.0 test
> jest --coverage

PASS tests/regla1.test.js
PASS tests/regla2.test.js
PASS tests/regla3.test.js
-------------|---------|----------|---------|---------|-------------------
File         | % Stmts | % Branch | % Funcs | % Lines | Uncovered Line #s 
-------------|---------|----------|---------|---------|-------------------
All files    |     100 |      100 |      100 |     100 |                   
 producto.js |     100 |      100 |      100 |     100 |                   
-------------|---------|----------|---------|---------|-------------------

Test Suites: 3 passed, 3 total
Tests:       8 passed, 8 total
Snapshots:   0 total
Time:        0.103 s, estimated 1 s
Ran all test suites.
```

### Detalles:
- **Total de Tests:** 8
- **Tests Pasados:** 8 ✅
- **Cobertura:** 100%
  - Sentencias (Stmts): 100%
  - Ramas (Branch): 100%
  - Funciones (Funcs): 100%
  - Líneas (Lines): 100%

### Tests Incluidos:
1. **Regla 1 - Validación de Precio Base**
   - CP01: Crear producto normal ✅
   - CP02: Precio cero debe lanzar error ✅
   - CP03: Precio negativo debe lanzar error ✅

2. **Regla 2 - Descuentos**
   - CP04: Descuento máximo 40% permitido ✅
   - CP05: Descuento 41% rechazado ✅
   - CP08: Descuento negativo rechazado ✅

3. **Regla 3 - Cálculo de Precio Final**
   - CP06: Precio final sin descuento (IVA 19%) ✅
   - CP07: Precio final con descuento ✅

---

## 2. Tests BDD (Cucumber)

### Comando:
```bash
npm run bdd
```

### Resultado Esperado:
```
> libreria-parcial-carlos-baron@1.0.0 bdd
> cucumber-js

...............

5 scenarios (5 passed)
15 steps (15 passed)
0m00.006s (executing steps: 0m00.000s)
```

### Detalles:
- **Total de Escenarios:** 5
- **Escenarios Pasados:** 5 ✅
- **Total de Steps:** 15
- **Steps Pasados:** 15 ✅

### Escenarios Incluidos:

#### Feature: Calculadora de precios
**Contexto:** Como administrador de la Librería del Centro, quiero que el sistema calcule el precio final de los productos con descuentos e IVA automáticamente.

**Background:** Tengo un producto base que cuesta 1000

**Escenarios:**
1. `Aplicar descuentos válidos [0%]` → Precio final: 1190 ✅
2. `Aplicar descuentos válidos [20%]` → Precio final: 952 ✅
3. `Aplicar descuentos válidos [40%]` → Precio final: 714 ✅
4. `Descuentos inválidos [41%]` → Rechazado con error ✅
5. `Descuentos inválidos [-1%]` → Rechazado con error ✅

---

## 3. Cómo Ejecutar Ambos Tests Simultáneamente

```bash
npm run test && npm run bdd
```

O ejecutarlos en paralelo:
```bash
npm run test &
npm run bdd
```

---

## 4. Estructura de Archivos de Tests

```
tests/
├── regla1.test.js      # Tests de validación de precio base
├── regla2.test.js      # Tests de descuentos
└── regla3.test.js      # Tests de cálculo final con IVA

features/
├── precio.feature      # Especificación BDD en Gherkin
└── step_definitions/
    └── steps.js        # Implementación de steps
```

---

## 5. Validación de Calidad

- ✅ **Cobertura de código:** 100%
- ✅ **Todos los casos de prueba diseñados:** Cubiertos
- ✅ **Ciclo TDD completado:** RED → GREEN → REFACTOR (para cada regla)
- ✅ **Tests nombrados descriptivamente:** Sí
- ✅ **BDD con escenarios de negocio:** Sí
- ✅ **Scenario Outline con Examples:** Implementado
- ✅ **Errores capturados:** Sí
- ✅ **Tags en escenarios:** @Validos, @Errores

---

## Evidencias Guardadas

Los outputs completos de cada ejecución están guardados en:
- `docs/evidencias/test-unitarios-output.txt`
- `docs/evidencias/test-bdd-output.txt`
