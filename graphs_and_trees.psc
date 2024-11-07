// Función para verificar si existe un camino hamiltoniano
Funcion hallarCaminosHamiltonianos(matrizAdyacencia, numeroVertices)
    Dimension visitados[100]  // Array para marcar vértices visitados
    Dimension caminoActual[100]  // Array para almacenar el camino actual
    Definir longitudCamino Como Entero
    Definir encontroCamino Como Logico
    encontroCamino <- Falso
    longitudCamino <- 0
    
    // Inicializar array de visitados
    Para i <- 1 Hasta numeroVertices Con Paso 1 Hacer
        visitados[i] <- Falso
    FinPara
    
    // Intentar encontrar camino hamiltoniano desde cada vértice
    Para verticeInicial <- 1 Hasta numeroVertices Con Paso 1 Hacer
        // Reiniciar visitados
        Para i <- 1 Hasta numeroVertices Con Paso 1 Hacer
            visitados[i] <- Falso
        FinPara
        
        longitudCamino <- 1
        caminoActual[1] <- verticeInicial
        visitados[verticeInicial] <- Verdadero
        
        buscarCaminoHamiltoniano(matrizAdyacencia, numeroVertices, verticeInicial, visitados, caminoActual, longitudCamino, encontroCamino)
    FinPara
    
    Si NO encontroCamino Entonces
        Escribir "No se encontraron caminos hamiltonianos"
    FinSi
FinFuncion

SubProceso buscarCaminoHamiltoniano(matrizAdyacencia, numeroVertices, verticeActual, visitados, caminoActual, longitudCamino, encontroCamino Por Referencia)
    // Si ya visitamos todos los vértices, encontramos un camino hamiltoniano
    Si longitudCamino = numeroVertices Entonces
        encontroCamino <- Verdadero
        Escribir Sin Saltar "Camino hamiltoniano encontrado: "
        Para i <- 1 Hasta numeroVertices Con Paso 1 Hacer
            Escribir Sin Saltar caminoActual[i]
            Si i < numeroVertices Entonces
                Escribir Sin Saltar " -> "
            FinSi
        FinPara
        Escribir ""
    Sino
        // Explorar vertices adyacentes no visitados
        Para i <- 1 Hasta numeroVertices Con Paso 1 Hacer
            Si matrizAdyacencia[verticeActual, i] = 1 Y NO visitados[i] Entonces
                visitados[i] <- Verdadero
                caminoActual[longitudCamino + 1] <- i
                buscarCaminoHamiltoniano(matrizAdyacencia, numeroVertices, i, visitados, caminoActual, longitudCamino + 1, encontroCamino)
                visitados[i] <- Falso
            FinSi
        FinPara
    FinSi
FinSubProceso

// Función para verificar si existe un camino euleriano
Funcion hallarCaminosEulerianos(matrizAdyacencia, numeroVertices)
    Definir gradoImpar Como Entero
    Dimension grados[100]
    gradoImpar <- 0
    
    // Calcular grado de cada vértice
    Para i <- 1 Hasta numeroVertices Con Paso 1 Hacer
        grados[i] <- 0
        Para j <- 1 Hasta numeroVertices Con Paso 1 Hacer
            grados[i] <- grados[i] + matrizAdyacencia[i,j]
        FinPara
        // Contar vértices con grado impar
        Si grados[i] MOD 2 <> 0 Entonces
            gradoImpar <- gradoImpar + 1
        FinSi
    FinPara
    
    // Verificar condiciones para caminos eulerianos
    Si gradoImpar = 0 Entonces
        Escribir "El grafo tiene un ciclo euleriano (camino cerrado)"
        // Encontrar y mostrar el ciclo
        encontrarCicloEuleriano(matrizAdyacencia, numeroVertices, 1)
    Sino Si gradoImpar = 2 Entonces
            Escribir "El grafo tiene un camino euleriano (camino abierto)"
            // Encontrar vértice inicial (uno de los vértices con grado impar)
            Para i <- 1 Hasta numeroVertices Con Paso 1 Hacer
                Si grados[i] MOD 2 <> 0 Entonces
                    encontrarCicloEuleriano(matrizAdyacencia, numeroVertices, i)
                    i <- numeroVertices  // Salir del ciclo después de encontrar el primer camino
                FinSi
            FinPara
        Sino
            Escribir "El grafo no tiene caminos eulerianos"
        FinSi
    FinSi
FinFuncion

SubProceso encontrarCicloEuleriano(matrizAdyacencia, numeroVertices, verticeInicial)
    Dimension copiaMatriz[100,100]
    Dimension camino[1000]  // Array más grande para almacenar el camino
    Definir longitudCamino Como Entero
    longitudCamino <- 0
    
    // Copiar matriz de adyacencia
    Para i <- 1 Hasta numeroVertices Con Paso 1 Hacer
        Para j <- 1 Hasta numeroVertices Con Paso 1 Hacer
            copiaMatriz[i,j] <- matrizAdyacencia[i,j]
        FinPara
    FinPara
    
    // Encontrar el camino
    encontrarCaminoEulerianoRecursivo(copiaMatriz, numeroVertices, verticeInicial, camino, longitudCamino)
    
    // Mostrar el camino
    Escribir Sin Saltar "Camino encontrado: "
    Para i <- 1 Hasta longitudCamino Con Paso 1 Hacer
        Escribir Sin Saltar camino[i]
        Si i < longitudCamino Entonces
            Escribir Sin Saltar " -> "
        FinSi
    FinPara
    Escribir ""
FinSubProceso

SubProceso encontrarCaminoEulerianoRecursivo(copiaMatriz, numeroVertices, verticeActual, camino, longitudCamino Por Referencia)
    Para i <- 1 Hasta numeroVertices Con Paso 1 Hacer
        Si copiaMatriz[verticeActual,i] = 1 Entonces
            // Eliminar la arista
            copiaMatriz[verticeActual,i] <- 0
            copiaMatriz[i,verticeActual] <- 0
            
            // Llamada recursiva
            encontrarCaminoEulerianoRecursivo(copiaMatriz, numeroVertices, i, camino, longitudCamino)
        FinSi
    FinPara
    
    // Agregar vértice actual al camino
    longitudCamino <- longitudCamino + 1
    camino[longitudCamino] <- verticeActual
FinSubProceso

Funcion hallarCaminos(matrizAdyacencia, numeroVertices)
    Dimension visitados[100]  // Array para marcar vértices visitados
    Dimension caminoActual[100]  // Array para almacenar el camino actual
    Definir longitudCamino Como Entero
    longitudCamino <- 0
    
    // Inicializar array de visitados
    Para i <- 1 Hasta numeroVertices Con Paso 1 Hacer
        visitados[i] <- Falso
    FinPara
    
    // Buscar caminos desde cada vértice
    Para verticeInicial <- 1 Hasta numeroVertices Con Paso 1 Hacer
        Para verticeFinal <- 1 Hasta numeroVertices Con Paso 1 Hacer
            Si verticeInicial <> verticeFinal Entonces
                // Reiniciar visitados para cada nuevo camino
                Para i <- 1 Hasta numeroVertices Con Paso 1 Hacer
                    visitados[i] <- Falso
                FinPara
                
                // Iniciar búsqueda de camino
                longitudCamino <- 0
                caminoActual[longitudCamino + 1] <- verticeInicial
                longitudCamino <- longitudCamino + 1
                visitados[verticeInicial] <- Verdadero
                
                Escribir "Caminos desde ", verticeInicial, " hasta ", verticeFinal, ":"
                buscarCaminosRecursivo(matrizAdyacencia, numeroVertices, verticeInicial, verticeFinal, visitados, caminoActual, longitudCamino)
            FinSi
        FinPara
    FinPara
FinFuncion

// Función auxiliar recursiva para encontrar caminos
SubProceso buscarCaminosRecursivo(matrizAdyacencia, numeroVertices, verticeActual, verticeFinal, visitados, caminoActual, longitudCamino)
    Definir imprimirCamino Como Logico
    imprimirCamino <- Falso
    
    // Si llegamos al vértice final, imprimimos el camino
    Si verticeActual = verticeFinal Entonces
        imprimirCamino <- Verdadero
    FinSi
    
    Si imprimirCamino Entonces
        Escribir Sin Saltar "Camino encontrado: "
        Para i <- 1 Hasta longitudCamino Con Paso 1 Hacer
            Escribir Sin Saltar caminoActual[i]
            Si i < longitudCamino Entonces
                Escribir Sin Saltar " -> "
            FinSi
        FinPara
        Escribir ""
    SiNo
        // Explorar todos los vértices adyacentes
        Para i <- 1 Hasta numeroVertices Con Paso 1 Hacer
            Si matrizAdyacencia[verticeActual, i] = 1 Y NO visitados[i] Entonces
                // Marcar como visitado y agregar al camino
                visitados[i] <- Verdadero
                caminoActual[longitudCamino + 1] <- i
                
                // Llamada recursiva
                buscarCaminosRecursivo(matrizAdyacencia, numeroVertices, i, verticeFinal, visitados, caminoActual, longitudCamino + 1)
                
                // Desmarcar al retroceder (backtracking)
                visitados[i] <- Falso
            FinSi
        FinPara
    FinSi
FinSubProceso

Funcion recibirGrafoTexto
    Dimension matrizAdyacencia[100,100]
    Definir numeroVertices, numeroAristas, aristasRestantes Como Entero
    Definir tipoGrafo Como Caracter
    
    Para i<-1 Hasta 100 Con Paso 1 Hacer
        Para j<-1 Hasta 100 Con Paso 1 Hacer
            matrizAdyacencia[i,j] = 0
        FinPara
    FinPara
    
    Escribir 'Ingrese numero de vertices: '
    Leer numeroVertices
    Escribir 'Ingrese numero de aristas: '
    Leer numeroAristas
    
    aristasRestantes <- numeroAristas
    
    Para i<-1 Hasta numeroVertices Con Paso 1 Hacer
        Para j<-1 Hasta numeroVertices Con Paso 1 Hacer
            Si aristasRestantes > 0 Entonces
                Escribir "El Vertice número: ", i , " tiene arista con el Vertice número: ", j , "?" 
                Escribir "Escribe 1 para Sí o 0 para No:"
                Leer entradaConexion
                
                Si entradaConexion = 1 Entonces
                    matrizAdyacencia[i,j] = 1
                    aristasRestantes = aristasRestantes - 1
                    Escribir "Aristas restantes: ", aristasRestantes
                FinSi
            FinSi
        FinPara
        
        // Si ya no quedan aristas, salir del ciclo exterior
        Si aristasRestantes <= 0 Entonces
            i <- numeroVertices  // Forzar la salida del ciclo exterior
        FinSi
    FinPara
    
    mostrarMatrizAdyacencia(matrizAdyacencia, numeroVertices)
    tipoGrafo <- validarTipoGrafoMatrizAdyacencia(matrizAdyacencia, numeroVertices, tipoGrafo)
    
FinFuncion


// Funcion que permite verificar o validar el tipo de grafo, el recibe una matriz de adyacencia
Funcion tipoGrafo <- validarTipoGrafoMatrizAdyacencia(matrizAdyacencia, numeroVertices, tipoGrafo)
	
	Definir dirigido Como Logico
	Definir completo Como Logico
	Definir simple 	 Como Logico
	
	dirigido := Falso
	completo := Verdadero
	simple 	 := Verdadero
	
	Para i=1 Hasta numeroVertices Hacer
		Para j=1 Hasta  numeroVertices Hacer
			
			Si matrizAdyacencia[i,j] <> matrizAdyacencia[j,i] Entonces
				dirigido := Verdadero
			FinSi
			
			Si i <> j y matrizAdyacencia[i,j] = 0 Entonces
				completo := Falso
			FinSi
			
			Si i = j y matrizAdyacencia[i,j] > 0 Entonces
				simple := Falso
			FinSi
			
		FinPara
	FinPara
	
	Escribir '¿El grafo es dirigido? - Respuesta :' dirigido
	
	Escribir '¿El grafo es completo? - Respuesta :' completo
	
	Escribir '¿El grafo es simple? - Respuesta :' simple
	
	// TODO terminar la definicion del tipo de grafo
	tipoGrafo  := 'Definir' 	
	
FinFuncion


// Funcion para mostrar la matriz de adyacencia
Funcion mostrarMatrizAdyacencia (matrizAdyacencia, numeroVertices)
	Escribir "Matriz de ingresada"
	
	Escribir Sin Saltar "     "
	Para j<-1 Hasta numeroVertices Hacer
		Escribir Sin Saltar "  ", j, " "
	FinPara
	Escribir ""
	
	Para i=1 Hasta numeroVertices Hacer
		Escribir Sin Saltar i, " |"
		Para j=1 Hasta numeroVertices Hacer
			Escribir Sin Saltar "  ", matrizAdyacencia[i, j], " "
		FinPara
		Escribir ""
	FinPara
	hallarCaminos(matrizAdyacencia, numeroVertices)
	hallarCaminosHamiltonianos(matrizAdyacencia, numeroVertices)
	hallarCaminosEulerianos(matrizAdyacencia, numeroVertices)
FinFuncion


// Funcion para Grafos con Matriz de Adyacencia
Funcion grafoMatrizAdyacencia
    Dimension matrizAdyacencia[100,100]
    Definir numeroVertices, gradoVertice, gradoGrafo Como Entero
    Definir tipoGrafo Como Caracter
	
    Escribir 'Ingrese numero de vertices'
    Leer numeroVertices
	
    Escribir 'Ingrese matriz de adyacencia (solo 0 o 1)'
    Para i <- 1 Hasta numeroVertices Hacer
        Para j <- 1 Hasta numeroVertices Hacer
            Repetir
                Escribir 'Ingrese el valor para posición [', i, ',', j, '] (0 o 1):'
                Leer matrizAdyacencia[i,j]
            Hasta Que matrizAdyacencia[i,j] = 0 o matrizAdyacencia[i,j] = 1
        FinPara
    FinPara
	
    mostrarMatrizAdyacencia(matrizAdyacencia, numeroVertices)
	
    tipoGrafo <- validarTipoGrafoMatrizAdyacencia(matrizAdyacencia, numeroVertices, tipoGrafo)
	
    // Calcular y mostrar los grados de cada vértice
    Escribir "Grados de los vértices:"
    Para i <- 1 Hasta numeroVertices Hacer
        gradoVertice <- 0
        Para j <- 1 Hasta numeroVertices Hacer
            gradoVertice <- gradoVertice + matrizAdyacencia[i,j]
            // Si hay un lazo, se suma 1 adicional al grado
            Si i = j Entonces
                gradoVertice <- gradoVertice + 1
            FinSi
        FinPara
        Escribir "Vértice ", i, ": ", gradoVertice
    FinPara
	
    // Calcular y mostrar el grado del grafo
    gradoGrafo <- 0
    Para i <- 1 Hasta numeroVertices Hacer
        gradoVertice <- 0
        Para j <- 1 Hasta numeroVertices Hacer
            gradoVertice <- gradoVertice + matrizAdyacencia[i,j]
            // Si hay un lazo, se suma 1 adicional al grado
            Si i = j Entonces
                gradoVertice <- gradoVertice + 1
            FinSi
        FinPara
        // Acumulamos el grado del vértice al grado total del grafo
        gradoGrafo <- gradoGrafo + gradoVertice
    FinPara
    Escribir "Grado del grafo: ", gradoGrafo
	
FinFuncion


// Funcion para solamente mostrar el menu, debe ser llamada siempre antes de seleccionarOpcionMenu
Funcion mostrarSubMenu
	Escribir '	   		   SUB-MENU	    	   '
	Escribir '---------------------------------'
	Escribir '(1) Ingresar Grafo			   '
	Escribir '(2) Ingresar Matriz de adyacencia'
Fin Funcion


// Funcion que permite mostrar la opcion que el usuario selecciono en el menu
Funcion mostrarOpcionSeleccionada (opcion)
	Escribir 'Elegiste la opcion: ', opcion
FinFuncion


// Funcion que permite leer la opcion que el usuario quiera seleccionar del menu
Funcion opcion <- leerOpcion(opcion)
	Escribir 'Seleccione una opcion por favor'
	Leer opcion
	Mientras opcion <> 1 y opcion <> 2 Hacer
		Escribir 'Seleccion no valida, vuelva a intentarlo por favor'
		Leer opcion
	Fin Mientras
FinFuncion


// Funcion para solamente mostrar el menu, debe ser llamada siempre antes de seleccionarOpcionMenu
Funcion mostrarMenu
	Escribir '		MENU		'
	Escribir '------------------'
	Escribir '(1) Grafos		'
	Escribir '(2) Arboles		'
Fin Funcion


// Funcion 'Hola Mundo'
Funcion saludar
	Escribir 'Hola Mundo'
Fin Funcion


// Algoritmo Principal (Funcion Main)
Algoritmo graphs_and_trees
	// Definicion variables Globales
	Definir opcionSubMenu Como Entero
	Definir opcionMenu Como Entero
	
	// Saludar
	saludar
	
	// Menu Principal
	mostrarMenu
	opcionMenu := leerOpcion(opcionMenu)
	mostrarOpcionSeleccionada(opcionMenu)
	
	// SubMenu
	Si opcionMenu = 1 Entonces
		mostrarSubMenu
		opcionSubMenu := leerOpcion(opcionSubMenu)
		mostrarOpcionSeleccionada(opcionSubMenu)
	SiNo  
		
		//TODO se debe tener la opcion para arboles aca
		
	FinSi
	
	
	// Si el usuario escogio Grafo
	Si opcionMenu = 1 y opcionSubMenu = 1 Entonces
		Escribir 'Recibire un grafo'
		//TODO se debe meter la funcion para recibir un grafo
			recibirGrafoTexto
		
	SiNo Si opcionMenu = 1 y opcionSubMenu = 2 Entonces
			
			Escribir 'Recibire una matriz de abyacencia'
			grafoMatrizAdyacencia
			
		FinSi
	FinSi
	
FinAlgoritmo