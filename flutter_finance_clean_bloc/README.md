# Flutter Finance App – Clean Architecture + BLoC

Aplicación de finanzas personales desarrollada en Flutter, enfocada en buenas prácticas de arquitectura, manejo de estado predecible y lógica de negocio clara.  
El objetivo del proyecto es demostrar un flujo completo de una feature real, aplicando Clean Architecture, BLoC y persistencia local.

Este repositorio forma parte de un portafolio profesional orientado a roles Flutter Middle–Senior.

---

## Funcionalidades

- Crear transacciones (ingresos y gastos)
- Editar transacciones existentes
- Eliminar transacciones con confirmación
- Cálculo automático de:
  - Ingresos
  - Gastos
  - Balance total
- Filtro de transacciones por mes
- Persistencia local (los datos se mantienen al cerrar la app)

---

## Arquitectura

El proyecto sigue Clean Architecture con enfoque feature-first:


### Capas
- Domain: lógica de negocio pura (entidades y casos de uso)
- Data: implementación concreta de persistencia (Hive)
- Presentation: UI y BLoC (sin lógica de negocio)

---

## Gestión de estado

La aplicación utiliza BLoC para manejar el estado de forma explícita y predecible.

El FinanceBloc controla:
- Carga inicial de transacciones
- Crear, editar y eliminar transacciones
- Cambio de mes seleccionado
- Emisión de estados consistentes para la UI

La interfaz reacciona únicamente a cambios de estado, manteniendo una separación clara de responsabilidades.

---

## Persistencia

Los datos se almacenan localmente usando Hive, lo que permite:
- Guardar transacciones
- Recuperar datos al reiniciar la app
- Mantener el estado entre sesiones

No se utiliza backend externo; el foco del proyecto está en arquitectura y lógica de negocio.

---

## Testing

El proyecto incluye un test unitario enfocado en la lógica central del negocio:
- Cálculo correcto de ingresos
- Cálculo correcto de gastos
- Cálculo correcto del balance

El test valida comportamiento, no interfaz gráfica.

---

## Tecnologías y herramientas

- Flutter 3.38.7
- Dart 3.x
- flutter_bloc
- equatable
- hive / hive_flutter
- intl
- flutter_test

---

## Ejecución del proyecto

Instalar dependencias y ejecutar:

```bash
flutter pub get
flutter run
