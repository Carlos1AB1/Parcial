# 📋 Carpeta de Evidencias

Esta carpeta contiene la evidencia completa de todas las pruebas ejecutadas para el Parcial 1 de Pruebas de Software.

## Contenido

### 📄 `index.html`
Página web interactiva que visualiza todas las evidencias de los tests. **Abre este archivo en el navegador para ver un reporte visual completo.**

**Características:**
- ✅ Resultados de tests unitarios (Jest)
- ✅ Resultados de tests BDD (Cucumber)
- ✅ Tabla de cobertura (100%)
- ✅ Detalles de todos los 8 casos de prueba
- ✅ Historial del ciclo TDD (🔴🟢🔵)
- ✅ Métricas visuales

### 📄 `test-unitarios.txt`
Salida bruta de la ejecución de `npm run test` (Jest con cobertura).

**Resumen:**
- 8 tests ejecutados ✓
- 3 test suites ejecutadas ✓
- 100% de cobertura alcanzada ✓
- Tiempo: 0.305 segundos

### 📄 `test-bdd.txt`
Salida bruta de la ejecución de `npm run bdd` (Cucumber).

**Resumen:**
- 5 escenarios ejecutados ✓
- 15 pasos ejecutados ✓
- 100% de escenarios pasaron ✓
- Tiempo: 0.005 segundos

## Cómo Ver las Evidencias

### Opción 1: Ver el Reporte Visual
1. Abre el archivo `evidencias/index.html` en tu navegador
2. Verás un dashboard visual con todas las métricas y resultados

### Opción 2: Ver los Logs Crudos
- Lee `test-unitarios.txt` para ver la salida exacta de Jest
- Lee `test-bdd.txt` para ver la salida exacta de Cucumber

### Opción 3: Ejecutar Nuevamente
```bash
npm run test        # Ejecutar tests unitarios
npm run bdd         # Ejecutar tests BDD
```

## Métricas Totales

| Métrica | Valor | Estado |
|---------|-------|--------|
| Tests Unitarios | 8/8 ✓ | 100% |
| Escenarios BDD | 5/5 ✓ | 100% |
| Pasos Cucumber | 15/15 ✓ | 100% |
| Cobertura Código | 100% | Perfecto |
| Casos de Prueba | 8/8 ✓ | 100% |

## Detalles de Casos Cubiertos

✅ **Regla 1 (Validación de Precio Base):**
- CP01: Crear producto con precio válido
- CP02: Rechazar precio cero
- CP03: Rechazar precio negativo

✅ **Regla 2 (Validación de Descuento):**
- CP04: Aceptar descuento máximo (40%)
- CP05: Rechazar descuento superior (41%)
- CP08: Rechazar descuento negativo (-1%)

✅ **Regla 3 (Cálculo con IVA):**
- CP06: Calcular con IVA sin descuento
- CP07: Calcular con IVA y descuento

## Ciclo TDD Completado

Cada regla pasó por el ciclo completo:

```
🔴 RED    → Escribir tests que fallan
🟢 GREEN  → Código mínimo para pasar
🔵 REFACTOR → Mejora y limpieza
```

Total de commits demostrando TDD: **12 commits** (4 por regla)

---

**Entrega: Carlos Arturo Baron Estrada**  
**Repositorio:** https://github.com/Carlos1AB1/Parcial.git
