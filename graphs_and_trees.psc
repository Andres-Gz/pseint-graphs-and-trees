// Funcion que permite mostrar la opcion que el usuario selecciono en el menu
Funcion mostrarOpcionSeleccionada (opcion)
	Escribir 'Elegiste la opcion: ', opcion
FinFuncion


// Funcion que permite leer la opcion que el usuario quiera seleccionar del menu
Funcion  opcion <- leerOpcionMenu
	Definir opcion Como Entero
	Leer opcion
FinFuncion


// Funcion para solamente mostrar el menu, debe ser llamada siempre antes de seleccionarOpcionMenu
Funcion mostrarMenu
	Escribir '		MENU		'
	Escribir '------------------'
	Escribir '(1) Grafos		'
	Escribir '(2) Arboles		'
	EScribir '(3) Salir			'
Fin Funcion


// Funcion 'Hola Mundo'
Funcion saludar
	Escribir 'Hola Mundo'
Fin Funcion


// Algoritmo Principal (Funcion Main)
Algoritmo graphs_and_trees
	saludar
	mostrarMenu
	mostrarOpcionSeleccionada(leerOpcionMenu)
FinAlgoritmo

