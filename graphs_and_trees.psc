// Funcion que permite mostrar la opcion que el usuario selecciono en el menu
Funcion mostrarOpcionSeleccionada (opcion)
	Escribir 'Elegiste la opcion: ', opcion
FinFuncion


// Funcion que permite leer la opcion que el usuario quiera seleccionar del menu
Funcion opcion <- leerOpcionMenu
	Definir opcion, opcionGrafo Como Entero
	Leer opcion
	
	// Si se seleccionó la opción "Grafos", mostrar el submenú
	Si opcion = 1 Entonces
		Escribir '		SUBMENU GRAFOS		'
		Escribir '------------------------'
		Escribir '(1) Ingresar grafo'
		Escribir '(2) Ingresar matriz de adyacencia'
		Leer opcionGrafo
		
		// Procesar la opción del submenú
		Segun opcionGrafo Hacer
			1: Escribir 'Ingresando grafo...'
				// Aquí implementar la lógica para ingresar un grafo
			2: Escribir 'Ingresando matriz de adyacencia...'
				// Aquí implementar la lógica para ingresar una matriz de adyacencia
		FinSegun
	FinSi
	
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
FinFuncion


// Algoritmo Principal (Funcion Main)
Algoritmo graphs_and_trees
	saludar
	mostrarMenu
	mostrarOpcionSeleccionada(leerOpcionMenu)
FinAlgoritmo