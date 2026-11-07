USE `mydb`;

-- ==========================================
-- 1. TABLAS INDEPENDIENTES (Sin llaves foráneas)
-- ==========================================

INSERT INTO `mydb`.`clinica_veterinaria` (`id`, `telefono`, `nombre`, `direccion`) VALUES
(1, 664123456, 'Clinica San Martin', 'Av. Principal 123'),
(2, 664987654, 'Huellitas San Diego', 'Blvd. Diaz Ordaz 45'),
(3, 664555888, 'Veterinaria del Sol', 'Calle Segunda 789'),
(4, 664222333, 'Patitas Felices', 'Zona Rio 101'),
(5, 664777999, 'Clinica Central', 'Col. Cacho 500');

INSERT INTO `mydb`.`adoptante` (`id`, `Nombre`, `Edad`, `Telefono`, `Adoptantecol`) VALUES
(1, 'Carlos Perez', 28, '6641112233', 'Col. Libertad'),
(2, 'Maria Gomez', 34, '6642223344', 'Playas de Tijuana'),
(3, 'Juan Lopez', 42, '6643334455', 'Zona Rio'),
(4, 'Ana Torres', 25, '6644445566', 'Otay'),
(5, 'Luis Martinez', 31, '6645556677', 'Santa Fe');

INSERT INTO `mydb`.`albergue` (`id`, `capacidad`, `telefono`, `direccion`) VALUES
(1, 50, '6640001111', 'Carretera Antiguo Camino 1'),
(2, 30, '6640002222', 'Valle Redondo 45'),
(3, 80, '6640003333', 'Ejido Lázaro Cárdenas 12'),
(4, 40, '6640004444', 'La Presa 88'),
(5, 60, '6640005555', 'Boulevard 2000');

INSERT INTO `mydb`.`estado` (`id`, `estado_de_la_mascota`) VALUES
(1, 'En recuperacion'),
(2, 'Sano y listo'),
(3, 'En observacion'),
(4, 'Bajo tratamiento'),
(5, 'Adoptado');

INSERT INTO `mydb`.`vacuna` (`id`, `Nombre_de_vacuna`, `Vacunacol`) VALUES
(1, 'Rabia', 'LoteA1'),
(2, 'Parvovirus', 'LoteB2'),
(3, 'Polivalente', 'LoteC3'),
(4, 'Leucemia felina', 'LoteD4'),
(5, 'Bordetella', 'LoteE5');

INSERT INTO `mydb`.`donante` (`id`, `telefono`) VALUES
(1, 664888111),
(2, 664888222),
(3, 664888333),
(4, 664888444),
(5, 664888555);


-- ==========================================
-- 2. TABLAS CON DEPENDENCIAS DE 1ER NIVEL
-- ==========================================

INSERT INTO `mydb`.`veterinario` (`id`, `nombre`, `cedula`, `clinica_veterinaria_id`) VALUES
(1, 'Dr. Roberto Gomez', 'CED12345', 1),
(2, 'Dra. Sofia Ruiz', 'CED67890', 2),
(3, 'Dr. Mario Castañeda', 'CED11223', 3),
(4, 'Dra. Elena Vargas', 'CED44556', 4),
(5, 'Dr. Javier Morales', 'CED77889', 5);

INSERT INTO `mydb`.`solicitud` (`id`, `Etapa`, `adoptante_id`) VALUES
(1, 'Revision', 1),
(2, 'Aprobada', 2),
(3, 'Entrevista', 3),
(4, 'Pendiente', 4),
(5, 'Finalizada', 5);

INSERT INTO `mydb`.`consulta_veterinaria` (`id`, `Tratamiento`, `Fecha`, `veterinario_id`) VALUES
(1, 'Desparasitacion general', '2026-03-01', 1),
(2, 'Curacion de herida', '2026-03-02', 2),
(3, 'Revision dental', '2026-03-03', 3),
(4, 'Examen de sangre', '2026-03-04', 4),
(5, 'Cirugia menor', '2026-03-05', 5);


-- ==========================================
-- 3. TABLA PRINCIPAL (MASCOTA)
-- ==========================================

INSERT INTO `mydb`.`mascota` (`id`, `edad`, `consulta_veterinaria_id`, `solicitud_id`, `albergue_id`, `estado_id`) VALUES
(1, 2, 1, 1, 1, 1),
(2, 3, 2, 2, 2, 2),
(3, 1, 3, 3, 3, 3),
(4, 5, 4, 4, 4, 4),
(5, 4, 5, 5, 5, 5);


-- ==========================================
-- 4. TABLAS QUE DEPENDEN DE MASCOTA
-- ==========================================

INSERT INTO `mydb`.`aplicacion_de_vacuna` (`id`, `Fecha_de_aplicacion`, `vacuna_id`, `mascota_id`) VALUES
(1, '2026-03-10', 1, 1),
(2, '2026-03-11', 2, 2),
(3, '2026-03-12', 3, 3),
(4, '2026-03-13', 4, 4),
(5, '2026-03-14', 5, 5);

INSERT INTO `mydb`.`donacion` (`id`, `aporte`, `monto`, `fecha`, `albergue_ID_Albergue`, `Donante_ID_Donante`, `Mascota_ID_Mascota`) VALUES
(1, 100, '500', '2026-03-01 10:30:00', 1, 1, 1),
(2, 150, '1200', '2026-03-02 11:15:00', 2, 2, 2),
(3, 200, '300', '2026-03-03 14:00:00', 3, 3, 3),
(4, 250, '750', '2026-03-04 09:45:00', 4, 4, 4),
(5, 300, '1500', '2026-03-05 16:20:00', 5, 5, 5);

INSERT INTO `mydb`.`especie` (`id`, `especie`, `Mascota_ID_Mascota`) VALUES
(1, 'Canino', 1),
(2, 'Felino', 2),
(3, 'Canino', 3),
(4, 'Felino', 4),
(5, 'Canino', 5);

INSERT INTO `mydb`.`raza` (`id`, `nombre`, `mascota_id`) VALUES
(1, 'Labrador', 1),
(2, 'Siamés', 2),
(3, 'Pastor Alemán', 3),
(4, 'Persa', 4),
(5, 'Golden Retriever', 5);