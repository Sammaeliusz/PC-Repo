# Maszyna
## Pamięć/Kontekst maszyny
* Maszyna posiada po N komórek pamięci typu int16 oraz double N>=32
* Maszyna posiada M komórek pamięci przechowujących wskaźniki typu void
* Z pamięci wskaźnikowej powinno korzystać się wyłącznie jeśli jest to absolutnie konieczne
* Wszystkie informacje które mają zostać przechowane pomiędzy wywołaniami stanu oraz które mają zostać przekazane między stanami powinny zostać zapisane w pamięci maszyny
* Pierwsze num_of_interupts+1 komórek pamięci typu int16(0-num_of_interupts) są komórkami specjalnego przeznaczenia i należy z nich świadomie korzystać(patrz Przerwania) 
## Stan
* Domyślny stan maszyny to stan 0
* Funkcje stanu zawsze przyjmują wskaźnik do maszyny
* Funkcje stanu muszą być typu void
* W funkcjach stanu można korzystać z lokalnych zmiennych
* Funkcje stanu powinny być atomiczne i nieblokujące
* Stany do maszyny zawsze należy dodawać przez addState
## Przerwania
Jeśli podczas zmiany stanu jedna z komórek pamięci int16(1-num_of_interupts) jest zerem aktywnym stanem staje się stan przypisany do tej komórki(1->1, 2->2, ...). Jeśli więcej niż 1 komórka jest zerowa, aktywnym stanem jest stan o najniższym numerze.
Domyślnie komórki obsługujące przerwania mają przypisaną wartość 1.