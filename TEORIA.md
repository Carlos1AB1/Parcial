# Teoría - Pruebas de Software

## Selección Múltiple

**SM-1:** C. Desarrollo tradicional con pruebas al final.
*Por qué las otras no son:* El shift-left empieza las pruebas desde la fase de planeación, el shift-right las hace en producción, y el problema real detallado aquí es dejar todo para el final (tradicional), lo que hace que encontrar y reparar bugs sea carísimo y estresante.

**SM-2:** B. La primera regla de Uncle Bob: no escribir código de producción sin que exista primero un test que falle.
*Por qué las otras no son:* Ni siquiera está en las fases de Refactor o Green; el desarrollador hizo toda la función saltándose olímpicamente escribir el test que obligue a diseñar ese código.

---

## Preguntas Abiertas

**PA-1:**
En la fase Green lo único que nos interesa es que la prueba pase, así el código sea un asco (hardcodeado, repetido, etc.). Esto se hace para validar la lógica mínima de inmediato. Si el desarrollador se emociona y empieza a programar algo "súper limpio y completo" desde cero, pierde el enfoque, se adelanta a requisitos, asume cosas que los tests aún no piden (violando TDD) y vuelve inútil la fase crítica de Refactor. TDD trabaja con pasitos de bebé; saltarse al código final destruye esa red de seguridad.

**PA-2:**
TDD tiene una mirada técnica: se enfoca en "cómo" construimos el código (funciones, clases, algoritmos) para prevenir problemas de arquitectura y bugs técnicos. BDD es funcional: se centra en "qué" hace el software desde la vista de negocio (usuario, administrador). Se complementan perfecto porque TDD asegura que los cimientos de la casa no se caigan, mientras que BDD asegura que realmente construimos la casa que el cliente quería, usando Gherkin para que ambos mundos se entiendan.

**PA-3:**
Una cobertura del 95% solo significa que el 95% de mis líneas de código se ejecutaron cuando corrí los tests, no que estén validadas lógicamente. Imagínate una función `restar(a, b) { return a + b; }` (un error craso) con una prueba que ejecute `restar(2, 2)`. La línea de código de suma sí se ejecuta (100% de cobertura), pero como nunca afirmaste si el resultado entregado era el correcto, el test pasa, tienes alta cobertura y tremendo bug metido en el código.

**PA-4:**
Quedarse probando solo el 20% es peligroso porque los sistemas casi nunca fallan en el medio rango, sino en las fronteras por errores tontos (como poner `<` en vez de `<=`). Para estar seguros habría que probar 0% y 40% para ver que los límites legales se acepten, y -1% y 41% para ver que los rechace. Atacando estos extremos nos garantizamos de que las paredes del rango son sólidas y no tienen huecos ocultos.

**PA-5:**
CI/CD es un motor que automatiza y acelera integrar código y enviarlo a producción. TDD y BDD brindan las pruebas que actúan como frenos y filtros de calidad en ese motor. Si montamos un pipeline de CI/CD brillante pero sin una red sólida de pruebas, literalmente estamos optimizando la entrega automática de bugs a nuestros usuarios; el código malo pasaría derecho sin que nadie lo detenga.